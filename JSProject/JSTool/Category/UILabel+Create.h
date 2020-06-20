//
//  UILabel+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Create)

/*
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 */
+ (UILabel *)creatLabelWithTitle:(NSString *)title
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment
                            font:(UIFont *)font;


/*
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 backGroundColor ：背景颜色
 */
+ (UILabel *)creatLabelWithTitle:(NSString *)title
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment
                            font:(UIFont *)font
                 backGroundColor:(UIColor *)backGroundColor;

/*
 frame  : frame
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 backGroundColor ：背景颜色
 */
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                       textAlignment:(NSTextAlignment)textAlignment
                              font:(UIFont *)font
                   backGroundColor:(UIColor *)backGroundColor;

//设置行间距
- (void)setLabelSpace:(CGFloat)space font:(UIFont*)font;

/**
 font.lineHeight;
 */
- (CGFloat)fontHeight;

/**
 等于: lineHeight - pointSize
 */
- (CGFloat)fontSpace;

@end

NS_ASSUME_NONNULL_END
