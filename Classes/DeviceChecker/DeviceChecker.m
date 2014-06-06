//
//  DeviceChecker.m
//  manacon
//
//  Created by kawakamin on 2014/04/18.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "DeviceChecker.h"

@implementation DeviceChecker

+(BOOL)isIphone4
{
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480){
        return true;
    }
    return false;
}


+(BOOL)isIphone5
{
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568){
        return true;
    }
    return false;   
}



+(BOOL)isIpad
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return true;
    }
    return false;
}


@end
