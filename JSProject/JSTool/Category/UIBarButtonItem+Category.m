//
//  UIBarButtonItem+Category.m
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/30.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "UIBarButtonItem+Category.h"
#import <objc/runtime.h>

static const void *BarButtonItemBlockKey = &BarButtonItemBlockKey;

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *)createBarButtonItemWithImageName:(NSString *)imageName
                                               action:(void (^)(id sender))action {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, BarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

//自定义barButtonItem 自定义标题
+ (UIBarButtonItem *)createCustomBarButtonItemWithFrame:(CGRect)frame
                                                  title:(NSString *)title
                                              textColor:(UIColor *)textColor
                                           textAlgnment:(NSTextAlignment)textAlgnment
                                                   font:(UIFont *)font
                                                 action:(void (^)(id sender))action {
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if(title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if(textAlgnment) {
        button.titleLabel.textAlignment = textAlgnment;
    }
    if(font) {
        button.titleLabel.font = font;
    }
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, BarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [backView addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:backView];
    return item;
}

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
                                                 action:(void (^)(id sender))action{
    //加背景要不然frame不正确
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if(title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if(textAlgnment) {
        button.titleLabel.textAlignment = textAlgnment;
    }
    if(font) {
        button.titleLabel.font = font;
    }
    if(backGroundColor) {
        button.backgroundColor = backGroundColor;
    }
    if(cornerRadius) {
        [button clipWithCornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
    }
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, BarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [backView addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:backView];
    return item;
}

+ (void)handleAction:(id)sender {
    void (^block)(id) = objc_getAssociatedObject(sender, BarButtonItemBlockKey);
    if (block) block(sender);
}

@end
