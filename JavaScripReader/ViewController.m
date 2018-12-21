//
//  ViewController.m
//  JavaScripReader
//
//  Created by Галина  Муравьева on 20.12.2018.
//  Copyright © 2018 none. All rights reserved.
//
#import "UIView+moveIfTextUnderKeyboard.h"
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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view bindToKeyboard];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view unbindFromKeyboard];
}
//устанавливаем дизайн
-(void)setViewsDesign
{
    [self setButtonDesign];
    [self progressDesign];
    [self setDesignToTextView:self.textViewWithJavaScript];
    [self setDesignToTextView:self.textViewWithResult];
}
-(void)progressDesign
{
    self.progress=[[CustomJSProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progress setHidden:YES];
    [self.view addSubview:self.progress];
}
-(void)viewDidLayoutSubviews{
    self.progress.frame=CGRectMake(self.javaScriptConvertButton.frame.origin.x, self.javaScriptConvertButton.frame.origin.y+self.javaScriptConvertButton.frame.size.height, self.javaScriptConvertButton.frame.size.width, 5);
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
//касание на кнопку
- (IBAction)javaScriptConvertButtonPressed:(id)sender {
    [self.view endEditing:YES];
    [self startreadJS];
}
//ковертируем
-(void)startreadJS
{
    NSArray *arrayForArguments=[self arrayForArguments];
    NSString *jsString=self.textViewWithJavaScript.text;
    [self.progress strartAnimateProgress];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^
                   {
                       [self getJSResultFromString:jsString withArrayOfArguments:arrayForArguments];
                   });
}

-(void)getJSResultFromString:(NSString *)string withArrayOfArguments:(NSArray *)array
{
    //sleep(5);//test for long convertation
    JSValue *ret=[string outputStringFromJavaScriptStringWithStringArguments:array];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.textViewWithResult.text=[NSString stringWithFormat:@"%@", ret];
        [self.progress endAnimateProgress];
    });
}
//составляем массив с аргументами для javaSkript
-(NSArray *)arrayForArguments
{
    return [NSArray arrayWithObjects:self.textFieldWithString.text,nil];
}
//действия поля ввода
- (IBAction)textFieldWithStringDidEndOnExit:(id)sender {
}
- (IBAction)textFieldWithStringDidEnd:(id)sender {
    if(self.textViewWithJavaScript.text.length>0)
        [self startreadJS];
}
//скрываем клавиатуру при касании экрана
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
