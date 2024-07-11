#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

#include <string>
#include <cassert>

extern "C" void webrogue_ios_main();

bool checkWASMJSCSupport() {
    JSContext *context = [[JSContext alloc] init];
    JSValue *retValue = [context evaluateScript: @"typeof WebAssembly"];
    return [[retValue toString] isEqualToString: @"object"];
}

extern "C" int webrogueMain() {
    assert(checkWASMJSCSupport());
    webrogue_ios_main();
    return 0;
}
