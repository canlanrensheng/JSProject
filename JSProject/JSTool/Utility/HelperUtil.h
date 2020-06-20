//
//  HelperUtil.h
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CountDownBlock)(NSInteger days, NSInteger hours, NSInteger minute, NSInteger second);

@interface HelperUtil : NSObject

//倒计时
+ (void)countDownWithTimeInterval:(NSTimeInterval)timeInterval countDownBlock:(CountDownBlock)countDownBlock;

//弹窗
+(void)showAlertController:(UIViewController *)vc alertTitle:(NSString *)title message:(NSString *)message actionTiles:(NSArray *)titles complainHandler:(void(^)(NSInteger index))handler;

@end

NS_ASSUME_NONNULL_END
