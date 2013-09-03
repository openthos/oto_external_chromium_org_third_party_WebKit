# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE := third_party_WebKit_Source_web_webkit_gyp
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_TAGS := optional
gyp_intermediate_dir := $(call local-intermediates-dir)
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared)

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES := \
	$(call intermediates-dir-for,GYP,third_party_WebKit_Source_core_webcore_gyp)/webcore.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,third_party_WebKit_Source_core_webcore_derived_gyp)/third_party_WebKit_Source_core_webcore_derived_gyp.a \
	$(call intermediates-dir-for,GYP,skia_skia_gyp)/skia.stamp \
	$(call intermediates-dir-for,GYP,third_party_icu_icuuc_gyp)/icuuc.stamp \
	$(call intermediates-dir-for,GYP,third_party_npapi_npapi_gyp)/npapi.stamp \
	$(call intermediates-dir-for,GYP,v8_tools_gyp_v8_gyp)/v8.stamp

GYP_GENERATED_OUTPUTS :=

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_GENERATED_SOURCES :=

GYP_COPIED_SOURCE_ORIGIN_DIRS :=

LOCAL_SRC_FILES := \
	third_party/WebKit/Source/core/platform/chromium/support/Platform.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebActiveGestureAnimation.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebArrayBuffer.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebAudioBus.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebCrypto.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebCryptoAlgorithm.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebCryptoKey.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebCursorInfo.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebData.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebDeviceMotionData.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebDeviceOrientationData.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebFloatQuad.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebHTTPBody.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebHTTPLoadInfo.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebMediaConstraints.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebMediaStream.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebMediaStreamSource.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebMediaStreamTrack.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebPrerender.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebPrerenderingSupport.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCConfiguration.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCICECandidate.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCSessionDescription.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCSessionDescriptionRequest.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCStatsRequest.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCStatsResponse.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebRTCVoidRequest.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebScrollbarImpl.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebScrollbarThemeClientImpl.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebScrollbarThemeGeometryNative.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebSocketStreamError.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebSourceInfo.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebSpeechSynthesisUtterance.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebSpeechSynthesisVoice.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebSpeechSynthesizerClientImpl.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebThreadSafeData.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebTransformKeyframe.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebURL.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebURLError.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebURLRequest.cpp \
	third_party/WebKit/Source/core/platform/chromium/support/WebURLResponse.cpp \
	third_party/WebKit/Source/web/ApplicationCacheHost.cpp \
	third_party/WebKit/Source/web/AssertMatchingEnums.cpp \
	third_party/WebKit/Source/web/AssociatedURLLoader.cpp \
	third_party/WebKit/Source/web/AsyncFileSystemChromium.cpp \
	third_party/WebKit/Source/web/AsyncFileWriterChromium.cpp \
	third_party/WebKit/Source/web/AutofillPopupMenuClient.cpp \
	third_party/WebKit/Source/web/BackForwardClientImpl.cpp \
	third_party/WebKit/Source/web/ChromeClientImpl.cpp \
	third_party/WebKit/Source/web/ColorChooserPopupUIController.cpp \
	third_party/WebKit/Source/web/ColorChooserUIController.cpp \
	third_party/WebKit/Source/web/CompositionUnderlineVectorBuilder.cpp \
	third_party/WebKit/Source/web/ContextFeaturesClientImpl.cpp \
	third_party/WebKit/Source/web/ContextMenuClientImpl.cpp \
	third_party/WebKit/Source/web/DOMUtilitiesPrivate.cpp \
	third_party/WebKit/Source/web/DatabaseObserver.cpp \
	third_party/WebKit/Source/web/DateTimeChooserImpl.cpp \
	third_party/WebKit/Source/web/DeviceOrientationClientProxy.cpp \
	third_party/WebKit/Source/web/DragClientImpl.cpp \
	third_party/WebKit/Source/web/EditorClientImpl.cpp \
	third_party/WebKit/Source/web/EventListenerWrapper.cpp \
	third_party/WebKit/Source/web/ExternalDateTimeChooser.cpp \
	third_party/WebKit/Source/web/ExternalPopupMenu.cpp \
	third_party/WebKit/Source/web/FindInPageCoordinates.cpp \
	third_party/WebKit/Source/web/FrameLoaderClientImpl.cpp \
	third_party/WebKit/Source/web/FullscreenController.cpp \
	third_party/WebKit/Source/web/GeolocationClientProxy.cpp \
	third_party/WebKit/Source/web/GraphicsLayerFactoryChromium.cpp \
	third_party/WebKit/Source/web/IDBCursorBackendProxy.cpp \
	third_party/WebKit/Source/web/IDBDatabaseBackendProxy.cpp \
	third_party/WebKit/Source/web/IDBFactoryBackendProxy.cpp \
	third_party/WebKit/Source/web/InbandTextTrackPrivateImpl.cpp \
	third_party/WebKit/Source/web/InspectorClientImpl.cpp \
	third_party/WebKit/Source/web/InspectorFrontendClientImpl.cpp \
	third_party/WebKit/Source/web/LinkHighlight.cpp \
	third_party/WebKit/Source/web/LocalFileSystemClient.cpp \
	third_party/WebKit/Source/web/MIDIClientImpl.cpp \
	third_party/WebKit/Source/web/MediaSourcePrivateImpl.cpp \
	third_party/WebKit/Source/web/NotificationPresenterImpl.cpp \
	third_party/WebKit/Source/web/PageOverlay.cpp \
	third_party/WebKit/Source/web/PageOverlayList.cpp \
	third_party/WebKit/Source/web/PageWidgetDelegate.cpp \
	third_party/WebKit/Source/web/PinchViewports.cpp \
	third_party/WebKit/Source/web/PopupContainer.cpp \
	third_party/WebKit/Source/web/PopupListBox.cpp \
	third_party/WebKit/Source/web/PopupMenuChromium.cpp \
	third_party/WebKit/Source/web/PrerendererClientImpl.cpp \
	third_party/WebKit/Source/web/ScrollbarGroup.cpp \
	third_party/WebKit/Source/web/SharedWorkerRepository.cpp \
	third_party/WebKit/Source/web/SourceBufferPrivateImpl.cpp \
	third_party/WebKit/Source/web/SpeechInputClientImpl.cpp \
	third_party/WebKit/Source/web/SpeechRecognitionClientProxy.cpp \
	third_party/WebKit/Source/web/StorageAreaProxy.cpp \
	third_party/WebKit/Source/web/StorageNamespaceProxy.cpp \
	third_party/WebKit/Source/web/StorageQuotaChromium.cpp \
	third_party/WebKit/Source/web/UserMediaClientImpl.cpp \
	third_party/WebKit/Source/web/ValidationMessageClientImpl.cpp \
	third_party/WebKit/Source/web/ViewportAnchor.cpp \
	third_party/WebKit/Source/web/WebAccessibilityObject.cpp \
	third_party/WebKit/Source/web/WebArrayBufferView.cpp \
	third_party/WebKit/Source/web/WebBindings.cpp \
	third_party/WebKit/Source/web/WebBlob.cpp \
	third_party/WebKit/Source/web/WebBlobData.cpp \
	third_party/WebKit/Source/web/WebCache.cpp \
	third_party/WebKit/Source/web/WebCachedURLRequest.cpp \
	third_party/WebKit/Source/web/WebColorName.cpp \
	third_party/WebKit/Source/web/WebCrossOriginPreflightResultCache.cpp \
	third_party/WebKit/Source/web/WebCustomElement.cpp \
	third_party/WebKit/Source/web/WebDOMActivityLogger.cpp \
	third_party/WebKit/Source/web/WebDOMCustomEvent.cpp \
	third_party/WebKit/Source/web/WebDOMEvent.cpp \
	third_party/WebKit/Source/web/WebDOMEventListener.cpp \
	third_party/WebKit/Source/web/WebDOMEventListenerPrivate.cpp \
	third_party/WebKit/Source/web/WebDOMMessageEvent.cpp \
	third_party/WebKit/Source/web/WebDOMMouseEvent.cpp \
	third_party/WebKit/Source/web/WebDOMMutationEvent.cpp \
	third_party/WebKit/Source/web/WebDOMProgressEvent.cpp \
	third_party/WebKit/Source/web/WebDOMResourceProgressEvent.cpp \
	third_party/WebKit/Source/web/WebDataSourceImpl.cpp \
	third_party/WebKit/Source/web/WebDatabase.cpp \
	third_party/WebKit/Source/web/WebDevToolsAgentImpl.cpp \
	third_party/WebKit/Source/web/WebDevToolsFrontendImpl.cpp \
	third_party/WebKit/Source/web/WebDeviceOrientation.cpp \
	third_party/WebKit/Source/web/WebDeviceOrientationClientMock.cpp \
	third_party/WebKit/Source/web/WebDeviceOrientationController.cpp \
	third_party/WebKit/Source/web/WebDocument.cpp \
	third_party/WebKit/Source/web/WebDocumentType.cpp \
	third_party/WebKit/Source/web/WebDragData.cpp \
	third_party/WebKit/Source/web/WebElement.cpp \
	third_party/WebKit/Source/web/WebEntities.cpp \
	third_party/WebKit/Source/web/WebFileChooserCompletionImpl.cpp \
	third_party/WebKit/Source/web/WebFileSystemCallbacksImpl.cpp \
	third_party/WebKit/Source/web/WebFontCache.cpp \
	third_party/WebKit/Source/web/WebFontDescription.cpp \
	third_party/WebKit/Source/web/WebFontImpl.cpp \
	third_party/WebKit/Source/web/WebFormControlElement.cpp \
	third_party/WebKit/Source/web/WebFormElement.cpp \
	third_party/WebKit/Source/web/WebFrameImpl.cpp \
	third_party/WebKit/Source/web/WebGeolocationClientMock.cpp \
	third_party/WebKit/Source/web/WebGeolocationController.cpp \
	third_party/WebKit/Source/web/WebGeolocationError.cpp \
	third_party/WebKit/Source/web/WebGeolocationPermissionRequest.cpp \
	third_party/WebKit/Source/web/WebGeolocationPermissionRequestManager.cpp \
	third_party/WebKit/Source/web/WebGeolocationPosition.cpp \
	third_party/WebKit/Source/web/WebGlyphCache.cpp \
	third_party/WebKit/Source/web/WebHelperPluginImpl.cpp \
	third_party/WebKit/Source/web/WebHistoryItem.cpp \
	third_party/WebKit/Source/web/WebHitTestResult.cpp \
	third_party/WebKit/Source/web/WebIDBCallbacksImpl.cpp \
	third_party/WebKit/Source/web/WebIDBDatabaseCallbacksImpl.cpp \
	third_party/WebKit/Source/web/WebIDBDatabaseError.cpp \
	third_party/WebKit/Source/web/WebIDBKey.cpp \
	third_party/WebKit/Source/web/WebIDBKeyPath.cpp \
	third_party/WebKit/Source/web/WebIDBKeyRange.cpp \
	third_party/WebKit/Source/web/WebIDBMetadata.cpp \
	third_party/WebKit/Source/web/WebImageCache.cpp \
	third_party/WebKit/Source/web/WebImageDecoder.cpp \
	third_party/WebKit/Source/web/WebImageSkia.cpp \
	third_party/WebKit/Source/web/WebInputElement.cpp \
	third_party/WebKit/Source/web/WebInputEvent.cpp \
	third_party/WebKit/Source/web/WebInputEventConversion.cpp \
	third_party/WebKit/Source/web/WebKit.cpp \
	third_party/WebKit/Source/web/WebLabelElement.cpp \
	third_party/WebKit/Source/web/WebMIDIPermissionRequest.cpp \
	third_party/WebKit/Source/web/WebMediaPlayerClientImpl.cpp \
	third_party/WebKit/Source/web/WebMediaSourceImpl.cpp \
	third_party/WebKit/Source/web/WebMediaStreamRegistry.cpp \
	third_party/WebKit/Source/web/WebNetworkStateNotifier.cpp \
	third_party/WebKit/Source/web/WebNode.cpp \
	third_party/WebKit/Source/web/WebNodeCollection.cpp \
	third_party/WebKit/Source/web/WebNodeList.cpp \
	third_party/WebKit/Source/web/WebNotification.cpp \
	third_party/WebKit/Source/web/WebOptionElement.cpp \
	third_party/WebKit/Source/web/WebPagePopupImpl.cpp \
	third_party/WebKit/Source/web/WebPageSerializer.cpp \
	third_party/WebKit/Source/web/WebPageSerializerImpl.cpp \
	third_party/WebKit/Source/web/WebPasswordFormData.cpp \
	third_party/WebKit/Source/web/WebPasswordFormUtils.cpp \
	third_party/WebKit/Source/web/WebPerformance.cpp \
	third_party/WebKit/Source/web/WebPluginContainerImpl.cpp \
	third_party/WebKit/Source/web/WebPluginDocument.cpp \
	third_party/WebKit/Source/web/WebPluginLoadObserver.cpp \
	third_party/WebKit/Source/web/WebPluginScrollbarImpl.cpp \
	third_party/WebKit/Source/web/WebPopupMenuImpl.cpp \
	third_party/WebKit/Source/web/WebRange.cpp \
	third_party/WebKit/Source/web/WebRuntimeFeatures.cpp \
	third_party/WebKit/Source/web/WebScopedMicrotaskSuppression.cpp \
	third_party/WebKit/Source/web/WebScopedUserGesture.cpp \
	third_party/WebKit/Source/web/WebScriptBindings.cpp \
	third_party/WebKit/Source/web/WebScriptController.cpp \
	third_party/WebKit/Source/web/WebScrollbarThemePainter.cpp \
	third_party/WebKit/Source/web/WebSearchableFormData.cpp \
	third_party/WebKit/Source/web/WebSecurityOrigin.cpp \
	third_party/WebKit/Source/web/WebSecurityPolicy.cpp \
	third_party/WebKit/Source/web/WebSelectElement.cpp \
	third_party/WebKit/Source/web/WebSerializedScriptValue.cpp \
	third_party/WebKit/Source/web/WebSettingsImpl.cpp \
	third_party/WebKit/Source/web/WebSharedWorkerImpl.cpp \
	third_party/WebKit/Source/web/WebSocket.cpp \
	third_party/WebKit/Source/web/WebSocketImpl.cpp \
	third_party/WebKit/Source/web/WebSpeechGrammar.cpp \
	third_party/WebKit/Source/web/WebSpeechInputResult.cpp \
	third_party/WebKit/Source/web/WebSpeechRecognitionHandle.cpp \
	third_party/WebKit/Source/web/WebSpeechRecognitionResult.cpp \
	third_party/WebKit/Source/web/WebStorageEventDispatcherImpl.cpp \
	third_party/WebKit/Source/web/WebSurroundingText.cpp \
	third_party/WebKit/Source/web/WebTextCheckingCompletionImpl.cpp \
	third_party/WebKit/Source/web/WebTextCheckingResult.cpp \
	third_party/WebKit/Source/web/WebTextInputInfo.cpp \
	third_party/WebKit/Source/web/WebTextRun.cpp \
	third_party/WebKit/Source/web/WebURLLoadTiming.cpp \
	third_party/WebKit/Source/web/WebUserGestureIndicator.cpp \
	third_party/WebKit/Source/web/WebUserGestureToken.cpp \
	third_party/WebKit/Source/web/WebUserMediaRequest.cpp \
	third_party/WebKit/Source/web/WebViewBenchmarkSupportImpl.cpp \
	third_party/WebKit/Source/web/WebViewImpl.cpp \
	third_party/WebKit/Source/web/WebWorkerBase.cpp \
	third_party/WebKit/Source/web/WebWorkerClientImpl.cpp \
	third_party/WebKit/Source/web/WebWorkerInfo.cpp \
	third_party/WebKit/Source/web/WebWorkerRunLoop.cpp \
	third_party/WebKit/Source/web/WorkerAllowMainThreadBridgeBase.cpp \
	third_party/WebKit/Source/web/WorkerAsyncFileSystemChromium.cpp \
	third_party/WebKit/Source/web/WorkerAsyncFileWriterChromium.cpp \
	third_party/WebKit/Source/web/WorkerFileSystemCallbacksBridge.cpp \
	third_party/WebKit/Source/web/WorkerFileSystemClient.cpp \
	third_party/WebKit/Source/web/WorkerFileWriterCallbacksBridge.cpp \
	third_party/WebKit/Source/web/android/WebInputEventFactory.cpp \
	third_party/WebKit/Source/web/linux/WebFontRenderStyle.cpp \
	third_party/WebKit/Source/web/linux/WebFontRendering.cpp \
	third_party/WebKit/Source/web/painting/ContinuousPainter.cpp \
	third_party/WebKit/Source/web/painting/PaintAggregator.cpp


# Flags passed to both C and C++ files.
MY_CFLAGS_Debug := \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-m32 \
	-mmmx \
	-march=pentium4 \
	-msse2 \
	-mfpmath=sse \
	-fuse-ld=gold \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-address \
	-Wno-format-security \
	-Wno-return-type \
	-Wno-sequence-point \
	-fno-stack-protector \
	-Os \
	-g \
	-fomit-frame-pointer \
	-fdata-sections \
	-ffunction-sections

MY_DEFS_Debug := \
	'-DANGLE_DX11' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_GPU=1' \
	'-DUSE_OPENSSL=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DENABLE_PRINTING=1' \
	'-DWEBKIT_IMPLEMENTATION=1' \
	'-DINSIDE_WEBKIT' \
	'-DENABLE_CSS3_TEXT=0' \
	'-DENABLE_CSS_EXCLUSIONS=1' \
	'-DENABLE_CSS_REGIONS=1' \
	'-DENABLE_CUSTOM_SCHEME_HANDLER=0' \
	'-DENABLE_ENCRYPTED_MEDIA_V2=1' \
	'-DENABLE_SVG_FONTS=1' \
	'-DENABLE_TOUCH_ICON_LOADING=1' \
	'-DENABLE_GDI_FONTS_ON_WINDOWS=1' \
	'-DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=1' \
	'-DENABLE_CALENDAR_PICKER=0' \
	'-DENABLE_FAST_MOBILE_SCROLLING=1' \
	'-DENABLE_INPUT_SPEECH=0' \
	'-DENABLE_LEGACY_NOTIFICATIONS=0' \
	'-DENABLE_MEDIA_CAPTURE=1' \
	'-DENABLE_NOTIFICATIONS=0' \
	'-DENABLE_ORIENTATION_EVENTS=1' \
	'-DENABLE_NAVIGATOR_CONTENT_UTILS=0' \
	'-DWTF_USE_NATIVE_FULLSCREEN_VIDEO=1' \
	'-DENABLE_OPENTYPE_VERTICAL=1' \
	'-DWTF_USE_HARFBUZZ=1' \
	'-DU_USING_ICU_NAMESPACE=0' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Debug := \
	$(gyp_shared_intermediate_dir)/shim_headers/skia_library/target \
	$(gyp_shared_intermediate_dir)/shim_headers/ashmem/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icuuc/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icui18n/target \
	$(LOCAL_PATH)/third_party/WebKit/public/web \
	$(LOCAL_PATH)/third_party/WebKit/Source/web \
	$(LOCAL_PATH)/third_party/angle_dx11/include \
	$(LOCAL_PATH)/third_party/skia/include/utils \
	$(LOCAL_PATH)/third_party/WebKit/public/web/android \
	$(LOCAL_PATH)/third_party/WebKit/public/web/linux \
	$(LOCAL_PATH)/third_party/khronos \
	$(LOCAL_PATH)/gpu \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/third_party/WebKit \
	$(LOCAL_PATH)/third_party/WebKit/Source \
	$(gyp_shared_intermediate_dir)/blink \
	$(gyp_shared_intermediate_dir)/blink/bindings \
	$(PWD)/external/icu4c/common \
	$(PWD)/external/icu4c/i18n \
	$(LOCAL_PATH)/third_party/qcms/src \
	$(LOCAL_PATH)/third_party/skia/src/core \
	$(LOCAL_PATH)/skia/ext \
	$(LOCAL_PATH)/third_party/npapi \
	$(LOCAL_PATH)/third_party/npapi/bindings \
	$(LOCAL_PATH)/v8/include \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Debug := \
	-Wno-c++0x-compat \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-error=c++0x-compat \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo \
	-Wno-non-virtual-dtor


# Flags passed to both C and C++ files.
MY_CFLAGS_Release := \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-m32 \
	-mmmx \
	-march=pentium4 \
	-msse2 \
	-mfpmath=sse \
	-fuse-ld=gold \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-address \
	-Wno-format-security \
	-Wno-return-type \
	-Wno-sequence-point \
	-fno-stack-protector \
	-Os \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections \
	-fomit-frame-pointer \
	-fno-unwind-tables \
	-fno-asynchronous-unwind-tables

MY_DEFS_Release := \
	'-DANGLE_DX11' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_GPU=1' \
	'-DUSE_OPENSSL=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DENABLE_PRINTING=1' \
	'-DWEBKIT_IMPLEMENTATION=1' \
	'-DINSIDE_WEBKIT' \
	'-DENABLE_CSS3_TEXT=0' \
	'-DENABLE_CSS_EXCLUSIONS=1' \
	'-DENABLE_CSS_REGIONS=1' \
	'-DENABLE_CUSTOM_SCHEME_HANDLER=0' \
	'-DENABLE_ENCRYPTED_MEDIA_V2=1' \
	'-DENABLE_SVG_FONTS=1' \
	'-DENABLE_TOUCH_ICON_LOADING=1' \
	'-DENABLE_GDI_FONTS_ON_WINDOWS=1' \
	'-DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=1' \
	'-DENABLE_CALENDAR_PICKER=0' \
	'-DENABLE_FAST_MOBILE_SCROLLING=1' \
	'-DENABLE_INPUT_SPEECH=0' \
	'-DENABLE_LEGACY_NOTIFICATIONS=0' \
	'-DENABLE_MEDIA_CAPTURE=1' \
	'-DENABLE_NOTIFICATIONS=0' \
	'-DENABLE_ORIENTATION_EVENTS=1' \
	'-DENABLE_NAVIGATOR_CONTENT_UTILS=0' \
	'-DWTF_USE_NATIVE_FULLSCREEN_VIDEO=1' \
	'-DENABLE_OPENTYPE_VERTICAL=1' \
	'-DWTF_USE_HARFBUZZ=1' \
	'-DU_USING_ICU_NAMESPACE=0' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Release := \
	$(gyp_shared_intermediate_dir)/shim_headers/skia_library/target \
	$(gyp_shared_intermediate_dir)/shim_headers/ashmem/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icuuc/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icui18n/target \
	$(LOCAL_PATH)/third_party/WebKit/public/web \
	$(LOCAL_PATH)/third_party/WebKit/Source/web \
	$(LOCAL_PATH)/third_party/angle_dx11/include \
	$(LOCAL_PATH)/third_party/skia/include/utils \
	$(LOCAL_PATH)/third_party/WebKit/public/web/android \
	$(LOCAL_PATH)/third_party/WebKit/public/web/linux \
	$(LOCAL_PATH)/third_party/khronos \
	$(LOCAL_PATH)/gpu \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/third_party/WebKit \
	$(LOCAL_PATH)/third_party/WebKit/Source \
	$(gyp_shared_intermediate_dir)/blink \
	$(gyp_shared_intermediate_dir)/blink/bindings \
	$(PWD)/external/icu4c/common \
	$(PWD)/external/icu4c/i18n \
	$(LOCAL_PATH)/third_party/qcms/src \
	$(LOCAL_PATH)/third_party/skia/src/core \
	$(LOCAL_PATH)/skia/ext \
	$(LOCAL_PATH)/third_party/npapi \
	$(LOCAL_PATH)/third_party/npapi/bindings \
	$(LOCAL_PATH)/v8/include \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Release := \
	-Wno-c++0x-compat \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-error=c++0x-compat \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo \
	-Wno-non-virtual-dtor


LOCAL_CFLAGS := $(MY_CFLAGS_$(GYP_CONFIGURATION)) $(MY_DEFS_$(GYP_CONFIGURATION))
LOCAL_C_INCLUDES := $(GYP_COPIED_SOURCE_ORIGIN_DIRS) $(LOCAL_C_INCLUDES_$(GYP_CONFIGURATION))
LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS_$(GYP_CONFIGURATION))
### Rules for final target.

LOCAL_LDFLAGS_Debug := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-m32 \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,--gc-sections \
	-Wl,-O1 \
	-Wl,--as-needed


LOCAL_LDFLAGS_Release := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-m32 \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections


LOCAL_LDFLAGS := $(LOCAL_LDFLAGS_$(GYP_CONFIGURATION))

LOCAL_STATIC_LIBRARIES := \
	third_party_WebKit_Source_core_webcore_derived_gyp

# Enable grouping to fix circular references
LOCAL_GROUP_STATIC_LIBRARIES := true

LOCAL_SHARED_LIBRARIES := \
	libskia \
	libstlport \
	libdl

# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: third_party_WebKit_Source_web_webkit_gyp

# Alias gyp target name.
.PHONY: webkit
webkit: third_party_WebKit_Source_web_webkit_gyp

include $(BUILD_STATIC_LIBRARY)
