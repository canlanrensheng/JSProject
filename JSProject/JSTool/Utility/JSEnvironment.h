//
//  JSEnvironment.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSEnvironment : NSObject

- (BOOL)isDev;          // 是否是开发环境,包含xcodebuild包+非常规bundleid等
- (BOOL)isTest;         // 是否是测试环境,灰度企业包
- (BOOL)isRelease;      // 是否是发布,包含app store + 第三方

- (CGFloat)sysVersion;
- (NSString *)appVersion;
- (NSString *)appBuildVersion;
- (NSString *)bundleId;
- (NSString *)appBundleId;
- (NSString *)appName;
- (NSString *)deviceName;
- (NSString *)channelId;
- (NSDictionary *)clientInfo;
- (NSString *)idfa;

@end

NS_ASSUME_NONNULL_END
