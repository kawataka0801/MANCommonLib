//
//  StoryboardClassMaker.m
//  manacon
//
//  Created by kawakamin on 2014/05/02.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "StoryboardClassMaker.h"
#import "DeviceChecker.h"

@implementation StoryboardClassMaker

static NSString *kStoryBoardName = @"Storyboard";
static NSString *kIphone4 = @"iPhone4";
static NSString *kIphone5 = @"iPhone5";
static NSString *kIpad = @"iPad";


+(NSString *)makeWithName:(NSString *)viewControllerName
{
    if ([DeviceChecker isIpad]){
        return [NSString stringWithFormat:@"%@_%@_%@", kStoryBoardName, viewControllerName, kIpad];
    }
    return [self makeIphonedNameWithName:viewControllerName];

}

+(NSString *)makeIphonedNameWithName:(NSString *)viewControllerName
{
    if([DeviceChecker isIphone4]){
        return [NSString stringWithFormat:@"%@_%@_%@", kStoryBoardName, viewControllerName, kIphone4];
    }else{
        return [NSString stringWithFormat:@"%@_%@_%@", kStoryBoardName, viewControllerName, kIphone5];
    }
}
    



@end
