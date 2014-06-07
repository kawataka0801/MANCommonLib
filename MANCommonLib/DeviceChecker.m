//
//  DeviceChecker.m
//  manacon
//
//  Created by kawakamin on 2014/04/18.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "DeviceChecker.h"

#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

int iPhoneWidth = 320;
int iPhone4Height = 480;
int iPhone5Height = 568;

@implementation DeviceChecker


+(BOOL)isIphone4
{
    if (SCREEN_WIDTH == iPhoneWidth && SCREEN_HEIGHT == iPhone4Height)
    {
        return true;
    }
    return false;
}


+(BOOL)isIphone5
{
    if (SCREEN_WIDTH == iPhoneWidth && SCREEN_HEIGHT == iPhone5Height)
    {
        return true;
    }
    return false;
}


+(BOOL)isIpad
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return true;
    }
    return false;
}


@end
