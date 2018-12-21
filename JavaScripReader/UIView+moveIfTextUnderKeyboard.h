//
//  UIView+moveIfTextUnderKeyboard.h
//  JavaScripReader
//
//  Created by pazl992 on 21.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UIView_moveIfTextUnderKeyboard)
-(void)bindToKeyboard;
-(void)unbindFromKeyboard;
@end

NS_ASSUME_NONNULL_END
