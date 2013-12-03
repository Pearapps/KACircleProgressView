//
//  KAViewController.h
//  KACircleProgressView
//
//  Created by Kenneth Parker Ackerson on 11/20/13.
//  Copyright (c) 2013 Kenneth Parker Ackerson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KACircleProgressView.h"
@interface KAViewController : UIViewController{
    UISlider *slider0;
    UISlider *slider1;
    UILabel *lblProgress;;
    UILabel *lblDuration;;
    double duration;
    KACircleProgressView * circlePV;
    
}

@end
