//
//  ApiErrorHandleHelper.m
//  manacon
//
//  Created by kawakamin on 2014/01/08.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "ApiErrorHandleHelper.h"

@implementation ApiErrorHandleHelper


+(BOOL)isContainsErrorString:(NSString *)errorString error:(NSError *)error{
    NSString *errorReason = [error localizedDescription];
    NSRange range = [errorReason rangeOfString:errorString];
    if (range.location != NSNotFound) return true;
    return false;
}

@end
