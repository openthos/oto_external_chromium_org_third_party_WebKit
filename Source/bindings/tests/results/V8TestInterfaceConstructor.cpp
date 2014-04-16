// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file has been auto-generated by code_generator_v8.py. DO NOT MODIFY!

#include "config.h"
#include "V8TestInterfaceConstructor.h"

#include "RuntimeEnabledFeatures.h"
#include "V8TestInterfaceEmpty.h"
#include "bindings/v8/Dictionary.h"
#include "bindings/v8/ExceptionState.h"
#include "bindings/v8/V8DOMConfiguration.h"
#include "bindings/v8/V8HiddenValue.h"
#include "bindings/v8/V8ObjectConstructor.h"
#include "core/dom/ContextFeatures.h"
#include "core/dom/Document.h"
#include "core/frame/DOMWindow.h"
#include "core/frame/UseCounter.h"
#include "platform/TraceEvent.h"
#include "wtf/GetPtr.h"
#include "wtf/RefPtr.h"

namespace WebCore {

static void initializeScriptWrappableForInterface(TestInterfaceConstructor* object)
{
    if (ScriptWrappable::wrapperCanBeStoredInObject(object))
        ScriptWrappable::setTypeInfoInObject(object, &V8TestInterfaceConstructor::wrapperTypeInfo);
    else
        ASSERT_NOT_REACHED();
}

} // namespace WebCore

void webCoreInitializeScriptWrappableForInterface(WebCore::TestInterfaceConstructor* object)
{
    WebCore::initializeScriptWrappableForInterface(object);
}

namespace WebCore {
const WrapperTypeInfo V8TestInterfaceConstructor::wrapperTypeInfo = { gin::kEmbedderBlink, V8TestInterfaceConstructor::domTemplate, V8TestInterfaceConstructor::derefObject, 0, 0, 0, V8TestInterfaceConstructor::installPerContextEnabledMethods, 0, WrapperTypeObjectPrototype, RefCountedObject };

namespace TestInterfaceConstructorV8Internal {

template <typename T> void V8_USE(T) { }

static void constructor1(const v8::FunctionCallbackInfo<v8::Value>& info)
{
    v8::Isolate* isolate = info.GetIsolate();
    ExceptionState exceptionState(ExceptionState::ConstructionContext, "TestInterfaceConstructor", info.Holder(), isolate);
    ExecutionContext* context = currentExecutionContext(isolate);
    Document& document = *toDocument(currentExecutionContext(isolate));
    RefPtr<TestInterfaceConstructor> impl = TestInterfaceConstructor::create(context, document, exceptionState);
    if (exceptionState.throwIfNeeded())
        return;

    v8::Handle<v8::Object> wrapper = info.Holder();
    V8DOMWrapper::associateObjectWithWrapper<V8TestInterfaceConstructor>(impl.release(), &V8TestInterfaceConstructor::wrapperTypeInfo, wrapper, isolate, WrapperConfiguration::Independent);
    v8SetReturnValue(info, wrapper);
}

static void constructor2(const v8::FunctionCallbackInfo<v8::Value>& info)
{
    v8::Isolate* isolate = info.GetIsolate();
    ExceptionState exceptionState(ExceptionState::ConstructionContext, "TestInterfaceConstructor", info.Holder(), isolate);
    TONATIVE_VOID(double, doubleArg, static_cast<double>(info[0]->NumberValue()));
    TOSTRING_VOID(V8StringResource<>, stringArg, info[1]);
    TONATIVE_VOID(TestInterfaceEmpty*, testInterfaceEmptyArg, V8TestInterfaceEmpty::toNativeWithTypeCheck(info.GetIsolate(), info[2]));
    TONATIVE_VOID(Dictionary, dictionaryArg, Dictionary(info[3], info.GetIsolate()));
    if (!dictionaryArg.isUndefinedOrNull() && !dictionaryArg.isObject()) {
        exceptionState.throwTypeError("parameter 4 ('dictionaryArg') is not an object.");
        exceptionState.throwIfNeeded();
        return;
    }
    TONATIVE_VOID(Vector<String>, sequenceStringArg, toNativeArray<String>(info[4], 5, info.GetIsolate()));
    TONATIVE_VOID(Vector<Dictionary>, sequenceDictionaryArg, toNativeArray<Dictionary>(info[5], 6, info.GetIsolate()));
    TONATIVE_VOID(Dictionary, optionalDictionaryArg, Dictionary(info[6], info.GetIsolate()));
    if (!optionalDictionaryArg.isUndefinedOrNull() && !optionalDictionaryArg.isObject()) {
        exceptionState.throwTypeError("parameter 7 ('optionalDictionaryArg') is not an object.");
        exceptionState.throwIfNeeded();
        return;
    }
    TONATIVE_VOID(TestInterfaceEmpty*, optionalTestInterfaceEmptyArg, V8TestInterfaceEmpty::toNativeWithTypeCheck(info.GetIsolate(), info[7]));
    ExecutionContext* context = currentExecutionContext(isolate);
    Document& document = *toDocument(currentExecutionContext(isolate));
    RefPtr<TestInterfaceConstructor> impl = TestInterfaceConstructor::create(context, document, doubleArg, stringArg, testInterfaceEmptyArg, dictionaryArg, sequenceStringArg, sequenceDictionaryArg, optionalDictionaryArg, optionalTestInterfaceEmptyArg, exceptionState);
    if (exceptionState.throwIfNeeded())
        return;

    v8::Handle<v8::Object> wrapper = info.Holder();
    V8DOMWrapper::associateObjectWithWrapper<V8TestInterfaceConstructor>(impl.release(), &V8TestInterfaceConstructor::wrapperTypeInfo, wrapper, isolate, WrapperConfiguration::Independent);
    v8SetReturnValue(info, wrapper);
}

static void constructor(const v8::FunctionCallbackInfo<v8::Value>& info)
{
    if (((info.Length() == 0))) {
        TestInterfaceConstructorV8Internal::constructor1(info);
        return;
    }
    if (((info.Length() == 6) && (V8TestInterfaceEmpty::hasInstance(info[2], info.GetIsolate())) && (info[3]->IsObject()) && (info[4]->IsArray()) && (info[5]->IsArray())) || ((info.Length() == 7) && (V8TestInterfaceEmpty::hasInstance(info[2], info.GetIsolate())) && (info[3]->IsObject()) && (info[4]->IsArray()) && (info[5]->IsArray()) && (info[6]->IsUndefined() || info[6]->IsObject())) || ((info.Length() == 8) && (V8TestInterfaceEmpty::hasInstance(info[2], info.GetIsolate())) && (info[3]->IsObject()) && (info[4]->IsArray()) && (info[5]->IsArray()) && (info[6]->IsUndefined() || info[6]->IsObject()) && (V8TestInterfaceEmpty::hasInstance(info[7], info.GetIsolate())))) {
        TestInterfaceConstructorV8Internal::constructor2(info);
        return;
    }
    throwTypeError(ExceptionMessages::failedToConstruct("TestInterfaceConstructor", "No matching constructor signature."), info.GetIsolate());
}

} // namespace TestInterfaceConstructorV8Internal

void V8TestInterfaceConstructor::constructorCallback(const v8::FunctionCallbackInfo<v8::Value>& info)
{
    TRACE_EVENT_SCOPED_SAMPLING_STATE("Blink", "DOMConstructor");
    UseCounter::count(callingExecutionContext(info.GetIsolate()), UseCounter::TestFeature);
    if (!info.IsConstructCall()) {
        throwTypeError(ExceptionMessages::constructorNotCallableAsFunction("TestInterfaceConstructor"), info.GetIsolate());
        return;
    }

    if (ConstructorMode::current(info.GetIsolate()) == ConstructorMode::WrapExistingObject) {
        v8SetReturnValue(info, info.Holder());
        return;
    }

    TestInterfaceConstructorV8Internal::constructor(info);
}

static void configureV8TestInterfaceConstructorTemplate(v8::Handle<v8::FunctionTemplate> functionTemplate, v8::Isolate* isolate)
{
    functionTemplate->ReadOnlyPrototype();

    v8::Local<v8::Signature> defaultSignature;
    defaultSignature = V8DOMConfiguration::installDOMClassTemplate(functionTemplate, "TestInterfaceConstructor", v8::Local<v8::FunctionTemplate>(), V8TestInterfaceConstructor::internalFieldCount,
        0, 0,
        0, 0,
        0, 0,
        isolate);
    functionTemplate->SetCallHandler(V8TestInterfaceConstructor::constructorCallback);
    functionTemplate->SetLength(0);
    v8::Local<v8::ObjectTemplate> ALLOW_UNUSED instanceTemplate = functionTemplate->InstanceTemplate();
    v8::Local<v8::ObjectTemplate> ALLOW_UNUSED prototypeTemplate = functionTemplate->PrototypeTemplate();

    // Custom toString template
    functionTemplate->Set(v8AtomicString(isolate, "toString"), V8PerIsolateData::from(isolate)->toStringTemplate());
}

v8::Handle<v8::FunctionTemplate> V8TestInterfaceConstructor::domTemplate(v8::Isolate* isolate)
{
    V8PerIsolateData* data = V8PerIsolateData::from(isolate);
    v8::Local<v8::FunctionTemplate> result = data->existingDOMTemplate(const_cast<WrapperTypeInfo*>(&wrapperTypeInfo));
    if (!result.IsEmpty())
        return result;

    TRACE_EVENT_SCOPED_SAMPLING_STATE("Blink", "BuildDOMTemplate");
    result = v8::FunctionTemplate::New(isolate, V8ObjectConstructor::isValidConstructorMode);
    configureV8TestInterfaceConstructorTemplate(result, isolate);
    data->setDOMTemplate(const_cast<WrapperTypeInfo*>(&wrapperTypeInfo), result);
    return result;
}

bool V8TestInterfaceConstructor::hasInstance(v8::Handle<v8::Value> v8Value, v8::Isolate* isolate)
{
    return V8PerIsolateData::from(isolate)->hasInstance(&wrapperTypeInfo, v8Value);
}

v8::Handle<v8::Object> V8TestInterfaceConstructor::findInstanceInPrototypeChain(v8::Handle<v8::Value> v8Value, v8::Isolate* isolate)
{
    return V8PerIsolateData::from(isolate)->findInstanceInPrototypeChain(&wrapperTypeInfo, v8Value);
}

TestInterfaceConstructor* V8TestInterfaceConstructor::toNativeWithTypeCheck(v8::Isolate* isolate, v8::Handle<v8::Value> value)
{
    return hasInstance(value, isolate) ? fromInternalPointer(v8::Handle<v8::Object>::Cast(value)->GetAlignedPointerFromInternalField(v8DOMWrapperObjectIndex)) : 0;
}

v8::Handle<v8::Object> V8TestInterfaceConstructor::createWrapper(PassRefPtr<TestInterfaceConstructor> impl, v8::Handle<v8::Object> creationContext, v8::Isolate* isolate)
{
    ASSERT(impl);
    ASSERT(!DOMDataStore::containsWrapper<V8TestInterfaceConstructor>(impl.get(), isolate));
    if (ScriptWrappable::wrapperCanBeStoredInObject(impl.get())) {
        const WrapperTypeInfo* actualInfo = ScriptWrappable::getTypeInfoFromObject(impl.get());
        // Might be a XXXConstructor::wrapperTypeInfo instead of an XXX::wrapperTypeInfo. These will both have
        // the same object de-ref functions, though, so use that as the basis of the check.
        RELEASE_ASSERT_WITH_SECURITY_IMPLICATION(actualInfo->derefObjectFunction == wrapperTypeInfo.derefObjectFunction);
    }

    v8::Handle<v8::Object> wrapper = V8DOMWrapper::createWrapper(creationContext, &wrapperTypeInfo, toInternalPointer(impl.get()), isolate);
    if (UNLIKELY(wrapper.IsEmpty()))
        return wrapper;

    installPerContextEnabledProperties(wrapper, impl.get(), isolate);
    V8DOMWrapper::associateObjectWithWrapper<V8TestInterfaceConstructor>(impl, &wrapperTypeInfo, wrapper, isolate, WrapperConfiguration::Independent);
    return wrapper;
}

void V8TestInterfaceConstructor::derefObject(void* object)
{
    fromInternalPointer(object)->deref();
}

template<>
v8::Handle<v8::Value> toV8NoInline(TestInterfaceConstructor* impl, v8::Handle<v8::Object> creationContext, v8::Isolate* isolate)
{
    return toV8(impl, creationContext, isolate);
}

} // namespace WebCore
