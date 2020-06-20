//
//  HelperUtil.m
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "HelperUtil.h"

@implementation HelperUtil

+ (void)countDownWithTimeInterval:(NSTimeInterval)timeInterval countDownBlock:(CountDownBlock)countDownBlock {
    static char dayTimerKey;
    __block NSInteger timeout = timeInterval;
    if (timeout != 0) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        objc_setAssociatedObject(self, &dayTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(timer, ^{
            if(timeout <= 0) {
                dispatch_source_t dayTimer = objc_getAssociatedObject(self, &dayTimerKey);
                if (dayTimer) {
                    dispatch_source_cancel(dayTimer);
                    dayTimer = nil;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    countDownBlock(0, 0, 0, 0);
                });
            } else {
                NSInteger days = (NSInteger)(timeout / (3600 * 24));
                NSInteger hours = (NSInteger)((timeout - days * 24 * 3600) / 3600);
                NSInteger minute = (NSInteger)(timeout - days * 24 * 3600 - hours * 3600) / 60;
                NSInteger second = timeout - days * 24 * 3600 - hours * 3600 - minute * 60;
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    countDownBlock(days, hours, minute, second);
                });
                timeout--;
            }
        });
        dispatch_resume(timer);
    }
}



+(void)showAlertController:(UIViewController *)vc alertTitle:(NSString *)title message:(NSString *)message actionTiles:(NSArray *)titles complainHandler:(void(^)(NSInteger index))handler{
    
    if (!vc)  vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (title) {
        NSMutableAttributedString *alertTitle = [[NSMutableAttributedString alloc] initWithString:title];
        [alertTitle addAttribute:NSFontAttributeName value:MediumFont(17) range:NSMakeRange(0, title.length)];
        [alertController setValue:alertTitle forKey:@"attributedTitle"];
    }
    
    if (message) {
        NSMutableAttributedString *alertMes = [[NSMutableAttributedString alloc] initWithString:message];
        [alertMes addAttribute:NSFontAttributeName value:RegularFont(16) range:NSMakeRange(0, message.length)];
        [alertController setValue:alertMes forKey:@"attributedMessage"];
    }
    
    if (titles.count == 1) {
        [alertController addAction:[UIAlertAction actionWithTitle:titles[0] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(0);
            };
        }]];
    }else{
        [alertController addAction:[UIAlertAction actionWithTitle:titles[0] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(0);
            };
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:titles[1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(1);
            };
        }]];
    }
    [vc presentViewController:alertController animated:YES completion:nil];
}


@end
