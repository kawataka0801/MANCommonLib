//
//  CustomTextView.h
//  manacon2.0
//
//  Created by 斉藤 祐介 on 8/14/12.
//
//

#import <UIKit/UIKit.h>

@interface CustomTextView : UITextView{
    NSString *placeholder;
    UIColor *placeholderColor;
    
@private
    UILabel *placeHolderLabel;
}

@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

- (id)initWithFrame:(CGRect)frame placeholder:(NSString *)string;
-(void)textChanged:(NSNotification*)notification;
@end
