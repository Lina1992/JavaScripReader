//
//  String+js.m
//  JavaScripReader
//
//  Created by Галина  Муравьева on 20.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import "String+js.h"
@implementation NSString (String_js)
-(JSValue *)outputStringFromJavaScriptString
{
    
    JSContext *context = [[JSContext alloc] init];
    [context evaluateScript:self];
    JSValue * func =context[@"testFunc"];
    JSValue *ret =[func callWithArguments:nil];    
    return ret;
}
-(JSValue *)outputStringFromJavaScriptStringWithStringArguments:(NSArray *)arguments
{
    JSContext *context = [[JSContext alloc] init];
    [context evaluateScript:self];
    JSValue * func =context[@"testFunc"];
    JSValue * ret =[func callWithArguments:arguments];
    return ret;
}
@end
