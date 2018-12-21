//
//  UIView+moveIfTextUnderKeyboard.m
//  JavaScripReader
//
//  Created by pazl992 on 21.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import "UIView+moveIfTextUnderKeyboard.h"

@implementation UIView (UIView_moveIfTextUnderKeyboard)
-(void)bindToKeyboard
{
    [self addObserverForKeyboard];
}
-(void)unbindFromKeyboard
{
    [self removeObserversForKeyboard];
}
-(void)addObserverForKeyboard
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)removeObserversForKeyboard
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardRect=[[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIView *editingView=[self findEditingTextFieldOrView];
    if(editingView!=nil && ![editingView isKindOfClass:[NSNull class]])
    {
        CGRect viewConvertedRect=[self convertRect:editingView.frame toView:nil];        if(viewConvertedRect.origin.y+30>self.frame.size.height-keyboardRect.size.height)//определяем перекрывает ли клавиатура вью
        {
            NSLog(@"move view");
            CGFloat deltaY=-keyboardRect.size.height;
            [UIView animateWithDuration:0.3 animations:^{
                CGRect superviewFrame=self.superview.frame;
                superviewFrame.origin.y+=deltaY;
                self.superview.frame=superviewFrame;
                
            }];
        }
        
    }
    
}
-(void)keyboardWillHide:(NSNotification *)notification
{
    CGRect superviewFrame=self.superview.frame;
    superviewFrame.origin.y=0.0f;
    self.superview.frame=superviewFrame;
}
//ищем поле которое редактируется
-(UIView *)findEditingTextFieldOrView
{
    UIView *editingTextFieldOrView;
    for(UIView *tf in self.subviews)
    {
        if([tf isKindOfClass:[UITextField class]] || [tf isKindOfClass:[UITextView class]])
        {
            if([tf isFirstResponder])
            {
                editingTextFieldOrView=tf;
                break;
            }
            
        }
    }
    return editingTextFieldOrView;
}
@end
