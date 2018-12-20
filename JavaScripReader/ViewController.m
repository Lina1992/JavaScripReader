//
//  ViewController.m
//  JavaScripReader
//
//  Created by Галина  Муравьева on 20.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import "ViewController.h"
#import "String+js.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewsDesign];
}
//устанавливаем дизайн
-(void)setViewsDesign
{
    [self setButtonDesign];
    [self setDesignToTextView:self.textViewWithJavaScript];
    [self setDesignToTextView:self.textViewWithResult];
    
}
-(void)setButtonDesign
{
    [self.javaScriptConvertButton setTitle:@"Выполнить" forState:UIControlStateNormal];
    [self.javaScriptConvertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.javaScriptConvertButton.backgroundColor=[UIColor colorWithRed:240.0f/255.0f
                                                                 green:240.0f/255.0f
                                                                  blue:240.0f/255.0f
                                                                 alpha:1.0f];
}
-(void)setDesignToTextView:(UITextView *)textView
{
    textView.layer.borderWidth=1;
    textView.layer.borderColor=[UIColor blackColor].CGColor;
}

- (IBAction)javaScriptConvertButtonPressed:(id)sender {
    
    [self getResult];
}
//ковертируем
-(void)getResult
{
    JSValue *ret=[self.textViewWithJavaScript.text outputStringFromJavaScriptStringWithStringArguments:[self arrayForArguments]];
    self.textViewWithResult.text=[NSString stringWithFormat:@"%@", ret];
}
-(NSArray *)arrayForArguments
{
    return [NSArray arrayWithObjects:self.textFieldWithString.text,nil];
}
@end
