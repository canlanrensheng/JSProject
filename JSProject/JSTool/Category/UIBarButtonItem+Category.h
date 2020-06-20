//
//  UIBarButtonItem+Category.h
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/30.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Category)

//图片
+ (UIBarButtonItem *)createBarButtonItemWithImageName:(NSString *)imageName
                                     action:(void (^)(id sender))action;

/*
 自定义barButtonItem 自定义标题
 */
+ (UIBarButtonItem *)createCustomBarButtonItemWithFrame:(CGRect)frame
                                                  title:(NSString *)title
                                              textColor:(UIColor *)textColor
                                           textAlgnment:(NSTextAlignment)textAlgnment
                                                   font:(UIFont *)font
                                                 action:(void (^)(id sender))action;

/*
 自定义barButtonItem 带边框
 */
+ (UIBarButtonItem *)createCustomBarButtonItemWithFrame:(CGRect)frame
                                                  title:(NSString *)title
                                              textColor:(UIColor *)textColor
                                           textAlgnment:(NSTextAlignment)textAlgnment
                                                   font:(UIFont *)font
                                        backGroundColor:(UIColor *)backGroundColor
                                           cornerRadius:(CGFloat)cornerRadius
                                            borderWidth:(CGFloat)borderWidth
                                            borderColor:(UIColor *)borderColor
                                                 action:(void (^)(id sender))action;

@end

NS_ASSUME_NONNULL_END
