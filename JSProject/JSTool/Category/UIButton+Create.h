//
//  UIButton+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/7.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ButtonLayoutStyle) {
    ButtonLayoutStyleImagePositionLeft = 0, //左边图片右边文字
    ButtonLayoutStyleImagePositionRight, //右边图片，左边文字
    ButtonLayoutStyleImagePositionTop, //上边图片下边文字
    ButtonLayoutStyleImagePositionBottom //上面文字下边图片
};


@interface UIButton (Create)

/*
 title  : 标题
 textColor  : 标题的颜色
 font : 字体大小
 target : target
 action : action
 **/
+ (UIButton *)creatButtonWithTitle:(NSString *)title
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                            target:(id)target
                            action:(SEL)action;

/*
 title  : 标题
 textColor  : 标题的颜色
 font : 字体大小
 backGroundColor ：背景颜色
 target : target
 action : action
 **/
+ (UIButton *)creatButtonWithTitle:(NSString *)title
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                   backGroundColor:(UIColor *)backGroundColor
                            target:(id)target
                            action:(SEL)action;

/*
 frame  : frame
 title  : 标题
 textColor  : 标题的颜色
 font : 字体大小
 backGroundColor ：背景颜色
 target : target
 action : action
 **/
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                            title:(NSString *)title
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                  backGroundColor:(UIColor *)backGroundColor
                            target:(id)target
                           action:(SEL)action;


/*
 frame  : frame
 title  : 标题
 textColor  : 标题的颜色
 font : 字体大小
 backGroundColor ：背景颜色
 action : action
 **/
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                   backGroundColor:(UIColor *)backGroundColor
                            action:(void (^)(id sender))action;



/*
 describe : 设置文字图片显示的排版和图片与文字之间的间距
 style : 文字和图片的排版
 spacing : 文字和图片之间的间距
 */
- (void)layoutWithStyle:(ButtonLayoutStyle)style space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
