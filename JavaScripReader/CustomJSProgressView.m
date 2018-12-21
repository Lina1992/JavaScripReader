//
//  CustomJSProgressView.m
//  JavaScripReader
//
//  Created by pazl992 on 21.12.2018.
//  Copyright © 2018 none. All rights reserved.
//

#import "CustomJSProgressView.h"

@implementation CustomJSProgressView
{
    NSTimer *progressTimer;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)strartAnimateProgress
{
    [self setProgress:0];
    [self setHidden:NO];
    
    if (progressTimer != nil) {
        [progressTimer invalidate];
        progressTimer = nil;
    }
    if (!progressTimer)
    {
        progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(updateProgressBarSlow) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:progressTimer forMode:NSRunLoopCommonModes];
    }
    
    
    
}
-(void)endAnimateProgress
{
    if (progressTimer != nil) {
        [progressTimer invalidate];
        progressTimer = nil;
        
    }
    if (!progressTimer)
    {
        progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(updateProgressBarFast) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:progressTimer forMode:NSRunLoopCommonModes];
    }
}
- (void)updateProgressBarSlow {
    float step=0.0008333;//1/1200
    float newProgress = [self progress] + step;
    [self setProgress:newProgress animated:YES];
    if(newProgress>=1.0)
    {
        [self setHidden:YES];
        if (progressTimer != nil) {
            [progressTimer invalidate];
            progressTimer = nil;
        }
    }
}
- (void)updateProgressBarFast {
    float step=0.05;
    float newProgress = [self progress] + step;
    [self setProgress:newProgress animated:YES];
    if(newProgress>=1.0)
    {
        [self setHidden:YES];
        if (progressTimer != nil) {
            [progressTimer invalidate];
            progressTimer = nil;
        }
    }
}
@end
