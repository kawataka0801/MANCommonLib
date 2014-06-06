//
//  UIAlertViewWithBlocks.h
//  manacon
//
//  Created by kawakamin on 2014/04/02.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertViewWithBlocks : UIAlertView

//-(void)showWithCompletion:(void(^)(UIAlertView *alert, int index))completion;
-(void)showWithCompletion:(void(^)(int index))completion;

@end
