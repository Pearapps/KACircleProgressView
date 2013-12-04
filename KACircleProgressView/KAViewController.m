//
//  KAViewController.m
//  KACircleProgressView
//
//  Created by Kenneth Parker Ackerson on 11/20/13.
//  Copyright (c) 2013 Kenneth Parker Ackerson. All rights reserved.
//

#import "KAViewController.h"
#import "PRTween.h"

@interface KAViewController ()

@end

@implementation KAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    circlePV = [[KACircleProgressView alloc] initWithSize:100 withType:KACircleProgressViewTypeCircleBacked andProgressBarLineWidth:7 andCircleBackLineWidth:7];
    [circlePV setProgress:0.3]; // set progress to 0.1 out of 1.0
    [self.view addSubview:circlePV];
    [circlePV setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
    [circlePV.button setBackgroundColor:[UIColor lightGrayColor]];
    [circlePV.button addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    [circlePV.button setTitle:@"Tap to refresh" forState:UIControlStateNormal];
     circlePV.button.layer.borderColor=[UIColor darkGrayColor].CGColor;
    circlePV.frame = CGRectMake(40, 220, 200, 200);
    
    slider0 = [[UISlider alloc]initWithFrame:CGRectMake(10, 20, 200, 30)];
    [slider0 setMinimumValue:0];
    [slider0 setMaximumValue:.99999];
    [slider0 setContinuous:YES];
    [slider0 setValue:0.3];
    [self.view addSubview:slider0];
    [slider0 addTarget:self action:@selector(handleValueChanged:event:) forControlEvents:UIControlEventValueChanged];
    
    slider1 = [[UISlider alloc]initWithFrame:CGRectMake(10, 140, 300, 30)];
    [slider1 setMinimumValue:0];
    [slider1 setMaximumValue:5];
    [slider1 setContinuous:YES];
    [slider1 setValue:.50];
    [self.view addSubview:slider1];
    [slider1 addTarget:self action:@selector(slider1ValueChanged) forControlEvents:UIControlEventValueChanged];
    
    
    duration = 2.00;
    lblProgress = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 200, 30)];
    lblProgress.textAlignment = NSTextAlignmentCenter;
    lblProgress.lineBreakMode = NSLineBreakByClipping;
    lblProgress.backgroundColor = [UIColor clearColor];
    lblProgress.text = @"Progress";
    lblProgress.textColor = [UIColor blackColor];
    [self.view addSubview:lblProgress];
    
    lblDuration = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 300, 30)];
    lblDuration.textAlignment = NSTextAlignmentCenter;
    lblDuration.lineBreakMode = NSLineBreakByClipping;
    lblDuration.backgroundColor = [UIColor clearColor];
    
    lblDuration.text = [NSString stringWithFormat:@"Animation Duration (%.2f) seconds",duration];
    lblDuration.textColor = [UIColor blackColor];
    [self.view addSubview:lblDuration];
    
  
}

-(void)slider1ValueChanged{
    
    lblDuration.text = [NSString stringWithFormat:@"Animation Duration (%.2f) seconds",slider1.value ];
    duration = slider1.value;
    
}



- (void)handleValueChanged:(id)sender event:(id)event {
    
    int percent = slider0.value *100;
    lblProgress.text = [NSString stringWithFormat:@"Progress value (%d %@)",percent,@"%"];
    
    UITouch *touchEvent = [[event allTouches] anyObject]; // there's only one touch
    if (touchEvent.phase == UITouchPhaseBegan) {
        
        currentValue = slider0.value;
    }

    if (touchEvent.phase == UITouchPhaseEnded) {
        [self animate];
    }
    
    
}

-(void)refresh{
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:slider0.value endValue:0 duration:duration];
    
    PRTweenOperation *operation = [PRTweenOperation new];
    operation.period = period;
    operation.target = self;
    operation.timingFunction = &PRTweenTimingFunctionCircOut;
    operation.updateSelector = @selector(update:);
    
    [[PRTween sharedInstance] addTweenOperation:operation];

}
-(void)animate{

    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:currentValue endValue:slider0.value duration:duration];
    PRTweenOperation *operation = [PRTweenOperation new];
    operation.period = period;
    operation.target = self;
    operation.timingFunction = &PRTweenTimingFunctionCircOut;
    operation.updateSelector = @selector(update:);
    [[PRTween sharedInstance] addTweenOperation:operation];
}

- (void)update:(PRTweenPeriod*)period {

    CGFloat f =period.tweenedValue;
    
    [circlePV setProgress:f];
    [circlePV setNeedsDisplay];

}




@end
