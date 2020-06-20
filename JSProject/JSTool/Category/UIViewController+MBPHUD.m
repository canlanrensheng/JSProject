//
//  UIViewController+MBPHUD.m
//  ysscw_ios
//
//  Created by next on 2018/8/27.
//  Copyright © 2018年 ysscw. All rights reserved.
//

#import "UIViewController+MBPHUD.h"

@implementation UIViewController (MBPHUD)

@dynamic hud;

- (MBProgressHUD *)hud {
    
    return self.view.hud;
}

- (void)showHUD {
    [self.view showHUD];
}

- (void)showHUDWithMessage:(nullable NSString *)message {
    [self.view showHUDWithMessage:message];
}

- (void)showHUDMessage:(NSString *)message {
    [self.view showHUDMessage:message];
}

- (void)showHUDMessage:(NSString *)message delay:(NSTimeInterval)delay completion:(nullable void(^)(void))completion  {
    [self.view showHUDMessage:message delay:delay completion:completion];
}

- (void)showHUDMessage:(NSString *)message inView:(UIView *)view {
    [self.view showHUDMessage:message inView:view];
}

- (void)showHUDWithImage:(UIImage *)image {
    [self.view showHUDWithImage:image];
}

- (void)showHUDWithImage:(UIImage *)image message:(nullable NSString *)message {
    [self.view showHUDWithImage:image message:message];
}

- (void)showHUDProgressHUD {
    [self.view showHUDProgressHUD];
}

- (void)showHUDProgressWithAlpha:(CGFloat)alpha {
    [self.view showHUDProgressWithAlpha:alpha];
}


- (void)showHUDProgressInView:(UIView *)view {
    [self.view showHUDProgressInView:view];
}

- (void)showHUDProgressWithMessage:(nullable NSString *)message {
    [self.view showHUDProgressWithMessage:message];
}


- (void)showHUDProgressWithMessage:(nullable NSString *)message style:(MBPHUDProgressStyle)style {
    [self.view showHUDProgressWithMessage:message style:style];
}

- (void)updateHUDProgress:(CGFloat)progress {
    [self.view updateHUDProgress:progress];
}

- (void)hideHUD {
    [self.view hideHUD];
}

- (void)hideHUDInView:(UIView *)view {
    [self.view hideHUDInView:view];
}

- (void)hideHUDCompletion:(nullable void(^)(void))completion {
    [self.view hideHUDCompletion:completion];
}

@end
