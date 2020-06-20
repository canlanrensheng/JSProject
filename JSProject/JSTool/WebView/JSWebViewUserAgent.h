//
//  MTWebViewUserAgentUpdater.h
//  TCoupon
//
//  Created by phenix on 2019/4/10.
//  Copyright © 2019 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSWebViewUserAgent : NSObject

+ (void)setupWithAppName:(NSString *)appName appVersion:(NSString *)appVersion;

/**
 如果 UserDefaults 里没有 UA，就创建一个 UIWebView 取出 UA，放进 UserDefaults。
 保证 WebView 创建的时候一定是有
 */
+ (void)saveUserAgentToUserDefaultsIfNeed;
+ (void)updateUserAgent;

@end

NS_ASSUME_NONNULL_END
