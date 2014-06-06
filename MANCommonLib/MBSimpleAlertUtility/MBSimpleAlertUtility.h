//
//  MBSimpleAlertUtility.h
//  manacon
//
//  Created by kawakamin on 13/05/09.
//  Copyright (c) 2013年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBSimpleAlertUtility : NSObject<UIAlertViewDelegate>

+(void)showAlertViewWithMessage:(NSString*)message;
+(void)showAlertViewWithTitie:(NSString *)title message:(NSString*)message;

@end
