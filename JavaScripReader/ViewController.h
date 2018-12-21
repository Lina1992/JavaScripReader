//
//  ViewController.h
//  JavaScripReader
//
//  Created by Галина  Муравьева on 20.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomJSProgressView.h"
@interface ViewController : UIViewController
@property (retain) CustomJSProgressView *progress;
@property (weak, nonatomic) IBOutlet UITextView *textViewWithJavaScript;
@property (weak, nonatomic) IBOutlet UITextView *textViewWithResult;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWithString;
- (IBAction)textFieldWithStringDidEndOnExit:(id)sender;
- (IBAction)textFieldWithStringDidEnd:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *javaScriptConvertButton;
- (IBAction)javaScriptConvertButtonPressed:(id)sender;


@end

