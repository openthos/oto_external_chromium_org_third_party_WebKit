/*
 * Copyright (c) 2011, Google Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Google Inc. nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "PopupContainer.h"

#include "PopupListBox.h"
#include "core/dom/Document.h"
#include "core/dom/UserGestureIndicator.h"
#include "core/page/Chrome.h"
#include "core/page/ChromeClient.h"
#include "core/page/Frame.h"
#include "core/page/FrameView.h"
#include "core/page/Page.h"
#include "core/platform/PlatformGestureEvent.h"
#include "core/platform/PlatformKeyboardEvent.h"
#include "core/platform/PlatformMouseEvent.h"
#include "core/platform/PlatformScreen.h"
#include "core/platform/PlatformTouchEvent.h"
#include "core/platform/PlatformWheelEvent.h"
#include "core/platform/PopupMenuClient.h"
#include "core/platform/chromium/FramelessScrollView.h"
#include "core/platform/chromium/FramelessScrollViewClient.h"
#include "core/platform/graphics/GraphicsContext.h"
#include "core/platform/graphics/IntRect.h"
#include <limits>

namespace WebCore {

static const int borderSize = 1;

static PlatformMouseEvent constructRelativeMouseEvent(const PlatformMouseEvent& e, FramelessScrollView* parent, FramelessScrollView* child)
{
    IntPoint pos = parent->convertSelfToChild(child, e.position());

    // FIXME: This is a horrible hack since PlatformMouseEvent has no setters for x/y.
    PlatformMouseEvent relativeEvent = e;
    IntPoint& relativePos = const_cast<IntPoint&>(relativeEvent.position());
    relativePos.setX(pos.x());
    relativePos.setY(pos.y());
    return relativeEvent;
}

static PlatformWheelEvent constructRelativeWheelEvent(const PlatformWheelEvent& e, FramelessScrollView* parent, FramelessScrollView* child)
{
    IntPoint pos = parent->convertSelfToChild(child, e.position());

    // FIXME: This is a horrible hack since PlatformWheelEvent has no setters for x/y.
    PlatformWheelEvent relativeEvent = e;
    IntPoint& relativePos = const_cast<IntPoint&>(relativeEvent.position());
    relativePos.setX(pos.x());
    relativePos.setY(pos.y());
    return relativeEvent;
}

// static
PassRefPtr<PopupContainer> PopupContainer::create(PopupMenuClient* client, PopupType popupType, const PopupContainerSettings& settings)
{
    return adoptRef(new PopupContainer(client, popupType, settings));
}

PopupContainer::PopupContainer(PopupMenuClient* client, PopupType popupType, const PopupContainerSettings& settings)
    : m_listBox(PopupListBox::create(client, settings))
    , m_settings(settings)
    , m_popupType(popupType)
    , m_popupOpen(false)
{
    setScrollbarModes(ScrollbarAlwaysOff, ScrollbarAlwaysOff);
}

PopupContainer::~PopupContainer()
{
    if (m_listBox && m_listBox->parent())
        removeChild(m_listBox.get());
}

IntRect PopupContainer::layoutAndCalculateWidgetRectInternal(IntRect widgetRectInScreen, int targetControlHeight, const FloatRect& windowRect, const FloatRect& screen, bool isRTL, const int rtlOffset, const int verticalOffset, const IntSize& transformOffset, PopupContent* listBox, bool& needToResizeView)
{
    ASSERT(listBox);
    if (windowRect.x() >= screen.x() && windowRect.maxX() <= screen.maxX() && (widgetRectInScreen.x() < screen.x() || widgetRectInScreen.maxX() > screen.maxX())) {
        // First, inverse the popup alignment if it does not fit the screen -
        // this might fix things (or make them better).
        IntRect inverseWidgetRectInScreen = widgetRectInScreen;
        inverseWidgetRectInScreen.setX(inverseWidgetRectInScreen.x() + (isRTL ? -rtlOffset : rtlOffset));
        inverseWidgetRectInScreen.setY(inverseWidgetRectInScreen.y() + (isRTL ? -verticalOffset : verticalOffset));
        IntRect enclosingScreen = enclosingIntRect(screen);
        unsigned originalCutoff = std::max(enclosingScreen.x() - widgetRectInScreen.x(), 0) + std::max(widgetRectInScreen.maxX() - enclosingScreen.maxX(), 0);
        unsigned inverseCutoff = std::max(enclosingScreen.x() - inverseWidgetRectInScreen.x(), 0) + std::max(inverseWidgetRectInScreen.maxX() - enclosingScreen.maxX(), 0);

        // Accept the inverse popup alignment if the trimmed content gets
        // shorter than that in the original alignment case.
        if (inverseCutoff < originalCutoff)
            widgetRectInScreen = inverseWidgetRectInScreen;

        if (widgetRectInScreen.x() < screen.x()) {
            widgetRectInScreen.setWidth(widgetRectInScreen.maxX() - screen.x());
            widgetRectInScreen.setX(screen.x());
            listBox->setMaxWidthAndLayout(std::max(widgetRectInScreen.width() - borderSize * 2, 0));
        } else if (widgetRectInScreen.maxX() > screen.maxX()) {
            widgetRectInScreen.setWidth(screen.maxX() - widgetRectInScreen.x());
            listBox->setMaxWidthAndLayout(std::max(widgetRectInScreen.width() - borderSize * 2, 0));
        }
    }

    // Calculate Y axis size.
    if (widgetRectInScreen.maxY() > static_cast<int>(screen.maxY())) {
        if (widgetRectInScreen.y() - widgetRectInScreen.height() - targetControlHeight - transformOffset.height() > 0) {
            // There is enough room to open upwards.
            widgetRectInScreen.move(-transformOffset.width(), -(widgetRectInScreen.height() + targetControlHeight + transformOffset.height()));
        } else {
            // Figure whether upwards or downwards has more room and set the
            // maximum number of items.
            int spaceAbove = widgetRectInScreen.y() - targetControlHeight + transformOffset.height();
            int spaceBelow = screen.maxY() - widgetRectInScreen.y();
            if (spaceAbove > spaceBelow)
                listBox->setMaxHeight(spaceAbove);
            else
                listBox->setMaxHeight(spaceBelow);
            listBox->layout();
            needToResizeView = true;
            widgetRectInScreen.setHeight(listBox->popupContentHeight() + borderSize * 2);
            // Move WebWidget upwards if necessary.
            if (spaceAbove > spaceBelow)
                widgetRectInScreen.move(-transformOffset.width(), -(widgetRectInScreen.height() + targetControlHeight + transformOffset.height()));
        }
    }
    return widgetRectInScreen;
}

IntRect PopupContainer::layoutAndCalculateWidgetRect(int targetControlHeight, const IntSize& transformOffset, const IntPoint& popupInitialCoordinate)
{
    // Reset the max width and height to their default values, they will be
    // recomputed below if necessary.
    m_listBox->setMaxHeight(PopupListBox::defaultMaxHeight);
    m_listBox->setMaxWidth(std::numeric_limits<int>::max());

    // Lay everything out to figure out our preferred size, then tell the view's
    // WidgetClient about it. It should assign us a client.
    m_listBox->layout();
    fitToListBox();
    bool isRTL = this->isRTL();

    // Compute the starting x-axis for a normal RTL or right-aligned LTR
    // dropdown. For those, the right edge of dropdown box should be aligned
    // with the right edge of <select>/<input> element box, and the dropdown box
    // should be expanded to the left if more space is needed.
    // m_originalFrameRect.width() is the width of the target <select>/<input>
    // element.
    int rtlOffset = m_controlPosition.p2().x() - m_controlPosition.p1().x() - (m_listBox->width() + borderSize * 2);
    int rightOffset = isRTL ? rtlOffset : 0;

    // Compute the y-axis offset between the bottom left and bottom right
    // points. If the <select>/<input> is transformed, they are not the same.
    int verticalOffset = - m_controlPosition.p4().y() + m_controlPosition.p3().y();
    int verticalForRTLOffset = isRTL ? verticalOffset : 0;

    // Assume m_listBox size is already calculated.
    IntSize targetSize(m_listBox->width() + borderSize * 2, m_listBox->height() + borderSize * 2);

    IntRect widgetRectInScreen;
    if (ChromeClient* client = chromeClient()) {
        // If the popup would extend past the bottom of the screen, open upwards
        // instead.
        FloatRect screen = screenAvailableRect(m_frameView.get());
        // Use popupInitialCoordinate.x() + rightOffset because RTL position
        // needs to be considered.
        widgetRectInScreen = client->rootViewToScreen(IntRect(popupInitialCoordinate.x() + rightOffset, popupInitialCoordinate.y() + verticalForRTLOffset, targetSize.width(), targetSize.height()));

        // If we have multiple screens and the browser rect is in one screen, we
        // have to clip the window width to the screen width.
        // When clipping, we also need to set a maximum width for the list box.
        FloatRect windowRect = client->windowRect();

        bool needToResizeView = false;
        widgetRectInScreen = layoutAndCalculateWidgetRectInternal(widgetRectInScreen, targetControlHeight, windowRect, screen, isRTL, rtlOffset, verticalOffset, transformOffset, m_listBox.get(), needToResizeView);
        if (needToResizeView)
            fitToListBox();
    }

    return widgetRectInScreen;
}

void PopupContainer::showPopup(FrameView* view)
{
    m_frameView = view;
    listBox()->m_focusedNode = m_frameView->frame()->document()->focusedNode();

    if (ChromeClient* client = chromeClient()) {
        IntSize transformOffset(m_controlPosition.p4().x() - m_controlPosition.p1().x(), m_controlPosition.p4().y() - m_controlPosition.p1().y() - m_controlSize.height());
        client->popupOpened(this, layoutAndCalculateWidgetRect(m_controlSize.height(), transformOffset, roundedIntPoint(m_controlPosition.p4())), false);
        m_popupOpen = true;
    }

    if (!m_listBox->parent())
        addChild(m_listBox.get());

    // Enable scrollbars after the listbox is inserted into the hierarchy,
    // so it has a proper WidgetClient.
    m_listBox->setVerticalScrollbarMode(ScrollbarAuto);

    m_listBox->scrollToRevealSelection();

    invalidate();
}

void PopupContainer::hidePopup()
{
    listBox()->hidePopup();
}

void PopupContainer::notifyPopupHidden()
{
    if (!m_popupOpen)
        return;
    m_popupOpen = false;
    chromeClient()->popupClosed(this);
}

void PopupContainer::fitToListBox()
{
    // Place the listbox within our border.
    m_listBox->move(borderSize, borderSize);

    // Size ourselves to contain listbox + border.
    resize(m_listBox->width() + borderSize * 2, m_listBox->height() + borderSize * 2);
    invalidate();
}

bool PopupContainer::handleMouseDownEvent(const PlatformMouseEvent& event)
{
    UserGestureIndicator gestureIndicator(DefinitelyProcessingNewUserGesture);
    return m_listBox->handleMouseDownEvent(
        constructRelativeMouseEvent(event, this, m_listBox.get()));
}

bool PopupContainer::handleMouseMoveEvent(const PlatformMouseEvent& event)
{
    UserGestureIndicator gestureIndicator(DefinitelyProcessingNewUserGesture);
    return m_listBox->handleMouseMoveEvent(
        constructRelativeMouseEvent(event, this, m_listBox.get()));
}

bool PopupContainer::handleMouseReleaseEvent(const PlatformMouseEvent& event)
{
    RefPtr<PopupContainer> protect(this);
    UserGestureIndicator gestureIndicator(DefinitelyProcessingNewUserGesture);
    return m_listBox->handleMouseReleaseEvent(
        constructRelativeMouseEvent(event, this, m_listBox.get()));
}

bool PopupContainer::handleWheelEvent(const PlatformWheelEvent& event)
{
    UserGestureIndicator gestureIndicator(DefinitelyProcessingNewUserGesture);
    return m_listBox->handleWheelEvent(
        constructRelativeWheelEvent(event, this, m_listBox.get()));
}

bool PopupContainer::handleTouchEvent(const PlatformTouchEvent&)
{
    return false;
}

// FIXME: Refactor this code to share functionality with
// EventHandler::handleGestureEvent.
bool PopupContainer::handleGestureEvent(const PlatformGestureEvent& gestureEvent)
{
    switch (gestureEvent.type()) {
    case PlatformEvent::GestureTap: {
        PlatformMouseEvent fakeMouseMove(gestureEvent.position(), gestureEvent.globalPosition(), NoButton, PlatformEvent::MouseMoved, /* clickCount */ 1, gestureEvent.shiftKey(), gestureEvent.ctrlKey(), gestureEvent.altKey(), gestureEvent.metaKey(), gestureEvent.timestamp());
        PlatformMouseEvent fakeMouseDown(gestureEvent.position(), gestureEvent.globalPosition(), LeftButton, PlatformEvent::MousePressed, /* clickCount */ 1, gestureEvent.shiftKey(), gestureEvent.ctrlKey(), gestureEvent.altKey(), gestureEvent.metaKey(), gestureEvent.timestamp());
        PlatformMouseEvent fakeMouseUp(gestureEvent.position(), gestureEvent.globalPosition(), LeftButton, PlatformEvent::MouseReleased, /* clickCount */ 1, gestureEvent.shiftKey(), gestureEvent.ctrlKey(), gestureEvent.altKey(), gestureEvent.metaKey(), gestureEvent.timestamp());
        // handleMouseMoveEvent(fakeMouseMove);
        handleMouseDownEvent(fakeMouseDown);
        handleMouseReleaseEvent(fakeMouseUp);
        return true;
    }
    case PlatformEvent::GestureScrollUpdate:
    case PlatformEvent::GestureScrollUpdateWithoutPropagation: {
        PlatformWheelEvent syntheticWheelEvent(gestureEvent.position(), gestureEvent.globalPosition(), gestureEvent.deltaX(), gestureEvent.deltaY(), gestureEvent.deltaX() / 120.0f, gestureEvent.deltaY() / 120.0f, ScrollByPixelWheelEvent, gestureEvent.shiftKey(), gestureEvent.ctrlKey(), gestureEvent.altKey(), gestureEvent.metaKey());
        handleWheelEvent(syntheticWheelEvent);
        return true;
    }
    case PlatformEvent::GestureScrollBegin:
    case PlatformEvent::GestureScrollEnd:
    case PlatformEvent::GestureTapDown:
        break;
    default:
        ASSERT_NOT_REACHED();
    }
    return false;
}

bool PopupContainer::handleKeyEvent(const PlatformKeyboardEvent& event)
{
    UserGestureIndicator gestureIndicator(DefinitelyProcessingNewUserGesture);
    return m_listBox->handleKeyEvent(event);
}

void PopupContainer::hide()
{
    m_listBox->abandon();
}

void PopupContainer::paint(GraphicsContext* gc, const IntRect& rect)
{
    // Adjust coords for scrolled frame.
    IntRect r = intersection(rect, frameRect());
    int tx = x();
    int ty = y();

    r.move(-tx, -ty);

    gc->translate(static_cast<float>(tx), static_cast<float>(ty));
    m_listBox->paint(gc, r);
    gc->translate(-static_cast<float>(tx), -static_cast<float>(ty));

    paintBorder(gc, rect);
}

void PopupContainer::paintBorder(GraphicsContext* gc, const IntRect& rect)
{
    // FIXME: Where do we get the border color from?
    Color borderColor(127, 157, 185);

    gc->setStrokeStyle(NoStroke);
    gc->setFillColor(borderColor, ColorSpaceDeviceRGB);

    int tx = x();
    int ty = y();

    // top, left, bottom, right
    gc->drawRect(IntRect(tx, ty, width(), borderSize));
    gc->drawRect(IntRect(tx, ty, borderSize, height()));
    gc->drawRect(IntRect(tx, ty + height() - borderSize, width(), borderSize));
    gc->drawRect(IntRect(tx + width() - borderSize, ty, borderSize, height()));
}

bool PopupContainer::isInterestedInEventForKey(int keyCode)
{
    return m_listBox->isInterestedInEventForKey(keyCode);
}

ChromeClient* PopupContainer::chromeClient()
{
    return m_frameView->frame()->page()->chrome().client();
}

void PopupContainer::showInRect(const FloatQuad& controlPosition, const IntSize& controlSize, FrameView* v, int index)
{
    // The controlSize is the size of the select box. It's usually larger than
    // we need. Subtract border size so that usually the container will be
    // displayed exactly the same width as the select box.
    listBox()->setBaseWidth(max(controlSize.width() - borderSize * 2, 0));

    listBox()->updateFromElement();

    // We set the selected item in updateFromElement(), and disregard the
    // index passed into this function (same as Webkit's PopupMenuWin.cpp)
    // FIXME: make sure this is correct, and add an assertion.
    // ASSERT(popupWindow(popup)->listBox()->selectedIndex() == index);

    // Save and convert the controlPosition to main window coords.
    m_controlPosition = controlPosition;
    IntPoint delta = v->contentsToWindow(IntPoint());
    m_controlPosition.move(delta.x(), delta.y());
    m_controlSize = controlSize;

    // Position at (0, 0) since the frameRect().location() is relative to the
    // parent WebWidget.
    setFrameRect(IntRect(IntPoint(), controlSize));
    showPopup(v);
}

IntRect PopupContainer::refresh(const IntRect& targetControlRect)
{
    listBox()->setBaseWidth(max(m_controlSize.width() - borderSize * 2, 0));
    listBox()->updateFromElement();

    IntPoint locationInWindow = m_frameView->contentsToWindow(targetControlRect.location());

    // Move it below the select widget.
    locationInWindow.move(0, targetControlRect.height());

    IntRect widgetRectInScreen = layoutAndCalculateWidgetRect(targetControlRect.height(), IntSize(), locationInWindow);

    // Reset the size (which can be set to the PopupListBox size in
    // layoutAndGetRTLOffset(), exceeding the available widget rectangle.)
    if (size() != widgetRectInScreen.size())
        resize(widgetRectInScreen.size());

    invalidate();

    return widgetRectInScreen;
}

inline bool PopupContainer::isRTL() const
{
    return m_listBox->m_popupClient->menuStyle().textDirection() == RTL;
}

int PopupContainer::selectedIndex() const
{
    return m_listBox->selectedIndex();
}

int PopupContainer::menuItemHeight() const
{
    return m_listBox->getRowHeight(0);
}

int PopupContainer::menuItemFontSize() const
{
    return m_listBox->getRowFont(0).size();
}

PopupMenuStyle PopupContainer::menuStyle() const
{
    return m_listBox->m_popupClient->menuStyle();
}

const WTF::Vector<PopupItem*>& PopupContainer:: popupData() const
{
    return m_listBox->items();
}

String PopupContainer::getSelectedItemToolTip()
{
    // We cannot use m_popupClient->selectedIndex() to choose tooltip message,
    // because the selectedIndex() might return final selected index, not
    // hovering selection.
    return listBox()->m_popupClient->itemToolTip(listBox()->m_selectedIndex);
}

} // namespace WebCore