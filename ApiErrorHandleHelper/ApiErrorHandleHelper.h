//
//  ApiErrorHandleHelper.h
//  manacon
//
//  Created by kawakamin on 2014/01/08.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiErrorHandleHelper : NSObject

+(BOOL)isContainsErrorString:(NSString *)errorString error:(NSError *)error;

@end
