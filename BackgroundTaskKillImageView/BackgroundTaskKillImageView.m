//
//  ModalImageView.m
//  manacon
//
//  Created by kawakamin on 2014/06/05.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "BackgroundTaskKillImageView.h"
#import "DeviceChecker.h"

@implementation BackgroundTaskKillImageView

NS_ENUM(int, DeviceType)
{
    iPhone5,
    iPhone4,
    iPad
};


+(id)myView
{
    UINib *nib = [UINib nibWithNibName:@"BackgroundTaskKillImageView" bundle:nil];
    
    int typeIndex = 0;
    
    if ([DeviceChecker isIpad])
    {
        typeIndex = iPad;
    }
    else if([DeviceChecker isIphone5])
    {
        typeIndex = iPhone5;
    }
    else
    {
        typeIndex = iPhone4;
    }

    BackgroundTaskKillImageView *view = [[nib instantiateWithOwner:self options:nil] objectAtIndex:typeIndex];
    return view;
}



-(void)show
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
    [UIView transitionWithView:window duration:0.25
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [window addSubview:self];
                    } completion:nil];
}



-(IBAction)okButtonPressed:(id)sender
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
    [UIView transitionWithView:window duration:0.25
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [self removeFromSuperview];
                    } completion:nil];
}




/**
 * グラデーションかけていい感じにする
 */

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    size_t locationsCount = 2;
    CGFloat locations[2] = {0.0f, 1.0f};
    CGFloat colors[8] = {0.0f,0.0f,0.0f,0.45f,0.0f,0.0f,0.0f,0.65f};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    float radius = MIN(self.bounds.size.width , self.bounds.size.height) ;
    CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
}




-(void)dealloc
{
    DLog(@"%@のdeallocが呼ばれました", self.class);
}


@end
