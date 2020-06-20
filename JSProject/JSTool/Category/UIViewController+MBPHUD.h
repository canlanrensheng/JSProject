//
//  UIViewController+MBPHUD.h
//  ysscw_ios
//
//  Created by next on 2018/8/27.
//  Copyright © 2018年 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+MBPHUD.h"

//NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MBPHUD)

@property (nonatomic,weak) MBProgressHUD * _Nullable hud;

- (void)showHUD;
- (void)showHUDWithMessage:(nullable NSString *)message;
- (void)showHUDMessage:(NSString *_Nonnull)message;
- (void)showHUDMessage:(NSString *_Nonnull)message delay:(NSTimeInterval)delay completion:(nullable void(^)(void))completion ;
- (void)showHUDMessage:(NSString *_Nonnull)message inView:(UIView *_Nonnull)view;

- (void)showHUDWithImage:(UIImage *_Nonnull)image;
- (void)showHUDWithImage:(UIImage *_Nonnull)image message:(nullable NSString *)message;

- (void)showHUDProgressHUD;
- (void)showHUDProgressInView:(UIView *_Nonnull)view;
- (void)showHUDProgressWithAlpha:(CGFloat)alpha;
- (void)showHUDProgressWithMessage:(nullable NSString *)message;
- (void)showHUDProgressWithMessage:(nullable NSString *)message style:(MBPHUDProgressStyle)style;
- (void)updateHUDProgress:(CGFloat)progress;

- (void)hideHUD;
- (void)hideHUDInView:(UIView *_Nonnull)view;
- (void)hideHUDCompletion:(nullable void(^)(void))completion;

@end

//NS_ASSUME_NONNULL_END
