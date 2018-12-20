//
//  String+js.h
//  JavaScripReader
//
//  Created by Галина  Муравьева on 20.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface  NSString (String_js)
-(JSValue *)outputStringFromJavaScriptString;
-(JSValue *)outputStringFromJavaScriptStringWithStringArguments:(NSArray *)arguments;
@end

NS_ASSUME_NONNULL_END
