//
//  MTWebViewUserAgentUpdater.m
//  TCoupon
//
//  Created by phenix on 2019/4/10.
//  Copyright © 2019 MT. All rights reserved.
//

#import "JSWebViewUserAgent.h"

@implementation JSWebViewUserAgent

static BOOL _userAgentUpdated;
static NSString *_appName;
static NSString *_appVersion;

+ (void)setupWithAppName:(NSString *)appName appVersion:(NSString *)appVersion {
    _appName = appName;
    _appVersion = appVersion;
}

+ (void)saveUserAgentToUserDefaultsIfNeed {
    if (_userAgentUpdated) {
        return;
    }
    _userAgentUpdated = YES;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *originUserAgent = [userDefaults objectForKey:@"kOriginUserAgent"];
    if (originUserAgent) {
        if ([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersion)]) {
            NSOperatingSystemVersion sysVer = [[NSProcessInfo processInfo] operatingSystemVersion];
            NSString *sysVerStr = [NSString stringWithFormat:@"OS %ld_%ld", (long)sysVer.majorVersion, (long)sysVer.minorVersion];
            if (sysVer.patchVersion) {
                sysVerStr = [sysVerStr stringByAppendingFormat:@"_%ld", (long)sysVer.patchVersion];
            }
            if (![originUserAgent containsString:sysVerStr]) {
                originUserAgent = nil;
            }
        }
    }
    
    NSString *append = [NSString stringWithFormat:@"%@/%@ (iPhone)", _appName, _appVersion];
    [userDefaults setObject:append forKey:@"kDefaultUserAgentAppend"];
    [userDefaults synchronize];
}

+ (void)updateUserAgent {
    [self saveUserAgentToUserDefaultsIfNeed];
    NSString *userAgent = [[NSUserDefaults standardUserDefaults] objectForKey:@"kOriginUserAgent"];
    if (!userAgent.length) { // 最后一道保险
        userAgent = @"Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) "
        @"Mobile/13E230";
    }
    NSString *userAgentAppend = [[NSUserDefaults standardUserDefaults] objectForKey:@"kDefaultUserAgentAppend"];
    if (!userAgentAppend.length) { // 最后一道保险
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        userAgentAppend = [NSString stringWithFormat:@"MT/%@ (iPhone)", version];
    }
    userAgent = [NSString stringWithFormat:@"%@ Hybrid/%@", userAgent, @""];
    userAgent = [NSString stringWithFormat:@"%@ %@", userAgent, userAgentAppend];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{ @"UserAgent": userAgent }];
}

@end
