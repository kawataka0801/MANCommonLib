//
//  UIAlertViewWithBlocks.m
//  manacon
//
//  Created by kawakamin on 2014/04/02.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "UIAlertViewWithBlocks.h"

@interface UIAlertViewWithBlocks () <UIAlertViewDelegate>

@end

@implementation UIAlertViewWithBlocks
{
    void (^_completion)(int index);
}


-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
          delegate:(id)delegate
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
    }
    return self;
}


-(void)showWithCompletion:(void(^)(int index))completion
{
    _completion = completion;
    [self show];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_completion) {
        _completion(buttonIndex);
        return;
    }
}



-(void)dealloc{
    DLog(@"%@のdeallocが呼ばれました",self.class);
    
}


@end