//
//  KAViewController.m
//  KACircleProgressView
//
//  Created by Kenneth Parker Ackerson on 11/20/13.
//  Copyright (c) 2013 Kenneth Parker Ackerson. All rights reserved.
//

#import "KAViewController.h"

@interface KAViewController ()

@end

@implementation KAViewController

- (void)viewDidLoad
{
    //  KACircleProgressView * c = [[KACircleProgressView alloc] initWithSize:20 withType:KACircleProgressViewTypeCircleBacked andProgressBarLineWidth:1 andCircleBackLineWidth:1];
    KACircleProgressView * c = [[KACircleProgressView alloc] initWithSize:100 withType:KACircleProgressViewTypeCircleBacked andProgressBarLineWidth:7 andCircleBackLineWidth:7];
    [c setProgress:0.3]; // set progress to 0.1 out of 1.0
    [self.view addSubview:c];
    [c setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
    //[self performSelector:@selector(upDate:) withObject:c afterDelay:0.05];
    [super viewDidLoad];
}

// testing setting progress by adding 0.01 ever 0.05 seconds
//- (void)upDate:(KACircleProgressView *)c{
//    [c setProgress:c.progress+0.01];
//    [self performSelector:@selector(upDate:) withObject:c afterDelay:0.05];
//}


@end
