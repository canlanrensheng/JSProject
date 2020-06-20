//
//  UITextField+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Create)

/*
 frame  : frame
 title  : 标题
 font : 字体大小
 placeholder ：占位文字
 clearButtonMode : 占位文字
 returnKeyType : 返回键的类型
 leftViewWidth : lelftView的宽度
 leftViewBackGroundColor : leftView的背景颜色
 leftViewMode : leftViewMode
 */
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                    font:(UIFont *)font
                             placeholder:(NSString *)placeholder
                         clearButtonMode:(UITextFieldViewMode)clearButtonMode
                           returnKeyType:(UIReturnKeyType)returnKeyType
                           leftViewWidth:(CGFloat)leftViewWidth
                 leftViewBackGroundColor:(UIColor *)leftViewBackGroundColor
                            leftViewMode:(UITextFieldViewMode)leftViewMode;

/*
 frame  : frame
 title  : 标题
 font : 字体大小
 placeholder ：占位文字
 clearButtonMode : 占位文字
 returnKeyType : 返回键的类型
 */
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                    font:(UIFont *)font
                             placeholder:(NSString *)placeholder
                         clearButtonMode:(UITextFieldViewMode)clearButtonMode
                           returnKeyType:(UIReturnKeyType)returnKeyType;

@end

NS_ASSUME_NONNULL_END
