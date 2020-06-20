//
//  UITextField+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UITextField+Create.h"

@implementation UITextField (Create)

+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                    font:(UIFont *)font
                             placeholder:(NSString *)placeholder
                         clearButtonMode:(UITextFieldViewMode)clearButtonMode
                           returnKeyType:(UIReturnKeyType)returnKeyType
                           leftViewWidth:(CGFloat)leftViewWidth
                 leftViewBackGroundColor:(UIColor *)leftViewBackGroundColor
                            leftViewMode:(UITextFieldViewMode)leftViewMode {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    if(font) {
        textField.font = font;
    }
    if(placeholder) {
        textField.placeholder = placeholder;
    }
    if(clearButtonMode) {
        textField.clearButtonMode = clearButtonMode;
    }
    if(returnKeyType) {
        textField.returnKeyType = returnKeyType;
    }
    if(leftViewWidth) {
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftViewWidth, frame.size.height)];
        leftView.backgroundColor = leftViewBackGroundColor;
        textField.leftView = leftView;
        textField.leftViewMode = leftViewMode;
    }
    return textField;
}

+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                    font:(UIFont *)font
                             placeholder:(NSString *)placeholder
                         clearButtonMode:(UITextFieldViewMode)clearButtonMode
                           returnKeyType:(UIReturnKeyType)returnKeyType {
    UITextField *textField = [UITextField creatTextFieldWithFrame:frame font:font placeholder:placeholder clearButtonMode:clearButtonMode returnKeyType:returnKeyType leftViewWidth:0 leftViewBackGroundColor:[UIColor clearColor] leftViewMode:0];
    return textField;
}

////搜索的方法
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    //搜索方法
//    if (textField.text.length > 0) {
//    } else {
//    }
//    return YES;
//}

//- (void)valueChanged:(UITextField *)textField{
//    //搜索内容改变的时候动态地请求数据源
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
//    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.0f];
//}

@end
