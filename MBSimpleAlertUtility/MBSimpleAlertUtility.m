//
//  MBSimpleAlertUtility.m
//  manacon
//
//  Created by kawakamin on 13/05/09.
//  Copyright (c) 2013年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "MBSimpleAlertUtility.h"

@implementation MBSimpleAlertUtility

+(void)showAlertViewWithMessage:(NSString*)message{
    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:nil
                                                 message:message
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [alt show];
}


+(void)showAlertViewWithTitie:(NSString *)title message:(NSString*)message{
    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:title
                                                 message:message
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [alt show];
}




@end
