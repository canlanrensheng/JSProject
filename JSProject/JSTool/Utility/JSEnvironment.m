//
//  JSEnvironment.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "JSEnvironment.h"
#include <sys/sysctl.h>
#include <sys/utsname.h>
#include <zlib.h>
@import MachO;
@import AdSupport;
//#import <OpenUDID/OpenUDID.h>

static NSString * const kAppHasEverBeenInsideCompanyLANKey = @"m-t-t-x-y-z";

@interface JSEnvironment() {
    NSString *_udid;
    NSString *_channelId;
    NSDictionary *_clientInfo;
}

@property (nonatomic, assign) CGFloat sysVersion;
@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *appBuildVersion;
@property (nonatomic, copy) NSString *bundleId;
@property (nonatomic, copy) NSString *appBundleId;
@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, assign, getter=isDev) BOOL dev;
@property (nonatomic, assign, getter=isTest) BOOL test;
@property (nonatomic, assign, getter=isRelease) BOOL release;
@property (copy, nonatomic) NSString *idfa;
@property (nonatomic, assign, readwrite) BOOL isInsideCompanyLAN;

@end

@implementation JSEnvironment

#ifdef DEBUG
+ (void)load {
    [self unitTest];
}

+ (void)unitTest {
//    JSEnvironment *env = [JSEnvironment new];
//    MTLogDebug(@"env", @"is isDev: %@", [env isDev] ? @"YES" : @"NO");
//    MTLogDebug(@"env", @"is isTest: %@", [env isTest] ? @"YES" : @"NO");
//    MTLogDebug(@"env", @"is isRelease: %@", [env isRelease] ? @"YES" : @"NO");
//    MTLogDebug(@"env", @"is appVersion: %@", [env appVersion]);
//    MTLogDebug(@"env", @"is sysVersion: %g", [env sysVersion]);
//    MTLogDebug(@"env", @"is appBuildVersion: %@", [env appBuildVersion]);
//    MTLogDebug(@"env", @"is appBundleId: %@", [env appBundleId]);
//    MTLogDebug(@"env", @"is appName: %@", [env appName]);
}
#endif

- (instancetype)init {
    self = [super init];
    if (self) {
       
    }
    return self;
}

- (void)dealloc {
   
}

- (void)resetClientInfo {
    _udid = nil;
    _clientInfo = nil;
}

- (BOOL)isDev {
    if (!_dev) {
        _dev = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DEBUG"] boolValue] || [[[NSBundle mainBundle] bundleIdentifier] rangeOfString:@".dev"].location != NSNotFound;
    }
    return _dev;
}

- (BOOL)isTest {
    if (!_test) {
        _test = [[[NSBundle mainBundle] bundleIdentifier] hasSuffix:@".enterprise"];
    }
    return _test;
}

- (BOOL)isRelease {
    return !([self isDev] || [self isTest]);
}

- (NSString *)appVersion {
    if (!_appVersion) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"] ?: @"";
    }
    return _appVersion;
}

- (CGFloat)sysVersion {
    if (!_sysVersion) {
        _sysVersion = [UIDevice currentDevice].systemVersion.floatValue;
    }
    return _sysVersion;
}

- (NSString *)appBuildVersion {
    if (!_appBuildVersion) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _appBuildVersion = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];
    }
    return _appBuildVersion;
}

- (NSString *)appBundleId {
    if (!_appBundleId) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _appBundleId = [infoDictionary objectForKey:(NSString *)kCFBundleIdentifierKey];
    }
    return _appBundleId;
}

- (NSString *)appName {
    if (!_appName) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _appName = [infoDictionary objectForKey:(NSString *)kCFBundleNameKey];
    }
    return _appName;
}

- (NSString *)deviceName {
    if (_deviceName == nil) {
        _deviceName = [self deviceModelName];
    }
    return _deviceName;
}

- (NSString*)deviceModelName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = @(systemInfo.machine);
    
    static NSDictionary *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{
                // iPhone 系列
                @"iPhone1,1": @"iPhone 1G",
                @"iPhone1,2": @"iPhone 3G",
                @"iPhone2,1": @"iPhone 3GS",
                @"iPhone3,1": @"iPhone 4",
                @"iPhone3,2": @"iPhone 4",
                @"iPhone4,1": @"iPhone 4S",
                @"iPhone5,1": @"iPhone 5",
                @"iPhone5,2": @"iPhone 5",
                @"iPhone5,3": @"iPhone 5C",
                @"iPhone5,4": @"iPhone 5C",
                @"iPhone6,1": @"iPhone 5S",
                @"iPhone6,2": @"iPhone 5S",
                @"iPhone7,1": @"iPhone 6 Plus",
                @"iPhone7,2": @"iPhone 6",
                @"iPhone8,1": @"iPhone 6s",
                @"iPhone8,2": @"iPhone 6s Plus",
                @"iPhone8,4": @"iPhone SE",
                @"iPhone9,1": @"iPhone 7",
                @"iPhone9,3": @"iPhone 7",
                @"iPhone9,2": @"iPhone 7 Plus",
                @"iPhone9,4": @"iPhone 7 Plus",
                @"iPhone10,1": @"iPhone 8",
                @"iPhone10,4": @"iPhone 8",
                @"iPhone10,2": @"iPhone 8 Plus",
                @"iPhone10,5": @"iPhone 8 Plus",
                @"iPhone10,3": @"iPhone X",
                @"iPhone10,6": @"iPhone X",
                
                // iPod 系列
                @"iPod1,1": @"iPod Touch 1G",
                @"iPod2,1": @"iPod Touch 2G",
                @"iPod3,1": @"iPod Touch 3G",
                @"iPod4,1": @"iPod Touch 4G",
                @"iPod5,1": @"iPod Touch 5G",
                
                //iPad 系列
                @"iPad1,1": @"iPad",
                
                @"iPad2,1": @"iPad 2",
                @"iPad2,2": @"iPad 2",
                @"iPad2,3": @"iPad 2",
                @"iPad2,4": @"iPad 2",
                
                @"iPad2,5": @"iPad mini",
                @"iPad2,6": @"iPad mini",
                @"iPad2,7": @"iPad mini",
                
                @"iPad3,1": @"iPad 3",
                @"iPad3,2": @"iPad 3",
                @"iPad3,3": @"iPad 3",
                
                @"iPad3,4": @"iPad 4",
                @"iPad3,5": @"iPad 4",
                @"iPad3,6": @"iPad 4",
                
                @"iPad4,1": @"iPad Air",
                @"iPad4,2": @"iPad Air",
                @"iPad4,3": @"iPad Air",
                @"iPad5,3": @"iPad Air 2",
                @"iPad5,4": @"iPad Air 2",
                
                @"i386": @"Simulator",
                @"x86_64": @"Simulator",
                
                @"iPad4,4": @"iPad mini 2",
                @"iPad4,5": @"iPad mini 2",
                @"iPad4,6": @"iPad mini 2",
                
                @"iPad4,7": @"iPad mini 3",
                @"iPad4,8": @"iPad mini 3",
                @"iPad4,9": @"iPad mini 3",
                };
    });
    return map[deviceModel] ?: deviceModel;
}

//- (NSString *)udid
//{
//    if (_udid == nil) {
//        
//        static NSString * const kBackupUDIDKey = @"udid_backup";
//        NSString *result = [[NSUserDefaults standardUserDefaults] objectForKey:kBackupUDIDKey];
//        NSString *source = nil;
//        
//        KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUID" accessGroup:nil];
//        
//        UIPasteboard *paste = [UIPasteboard pasteboardWithName:@"com.timiinfo" create:YES];
//        
//        if (result.length) {
//            MTLogInfo(@"UDID", @"syncronize UDID from backup to keychain: %@", result);
//            [keychainItem setObject:result forKey:(__bridge id)kSecValueData];
//            [paste setData:[result dataUsingEncoding:NSASCIIStringEncoding] forPasteboardType:@"udid"];
//            source = @"NSUserDefaults";
//        } else {
//            result = [keychainItem objectForKey:(__bridge id)kSecValueData];
//            if (result.length) {
//                MTLogInfo(@"UDID", @"UDID not found in NSUserDefaults, but found in keychain: %@", result);
//                [[NSUserDefaults standardUserDefaults] setObject:result forKey:kBackupUDIDKey];
//                [paste setData:[result dataUsingEncoding:NSASCIIStringEncoding] forPasteboardType:@"udid"];
//                source = @"keychain";
//            } else {
//                NSData *data = [paste dataForPasteboardType:@"udid"];
//                result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//                if (result.length) {
//                    MTLogInfo(@"UDID", @"UDID not found in NSUserDefaults and keychain, but found in husor's pasteboard: %@", result);
//                    [keychainItem setObject:result forKey:(__bridge id)kSecValueData];
//                    [[NSUserDefaults standardUserDefaults] setObject:result forKey:kBackupUDIDKey];
//                    source = @"UIPasteboard";
//                }
//                else {
//                    MTLogInfo(@"UDID", @"UDID not found in backup and keychain and mt's pasteboard, read from OpenUDID: %@", result);
//                    result = [OpenUDID value];
//                    [keychainItem setObject:result forKey:(__bridge id)kSecValueData];
//                    [[NSUserDefaults standardUserDefaults] setObject:result forKey:kBackupUDIDKey];
//                    [paste setData:[result dataUsingEncoding:NSASCIIStringEncoding] forPasteboardType:@"udid"];
//                    source = @"OpenUDID";
//                }
//            }
//        }
//        
//        // validate length
//        if (result.length < 40) {
//            [keychainItem setObject:nil forKey:(__bridge id)kSecValueData];
//            [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kBackupUDIDKey];
//            [paste setData:[NSData data] forPasteboardType:@"udid"];
//            
//            MTAssert(NO, @"UDID < 40, this should not happen, UDID = %@, UDID_source = %@", result, source);
//            return nil;
//        }
//        
//        if (result.length > 40) {
//            if ([result hasPrefix:@"<?xml"]) { // 出现了奇怪的 plist
//                NSUInteger si = [result rangeOfString:@"<string>"].location;
//                if (si != NSNotFound) {
//                    si += @"<string>".length;
//                }
//                NSUInteger ei = [result rangeOfString:@"</string>"].location;
//                if (ei != NSNotFound && si + 40 == ei) {
//                    result = [result substringWithRange:NSMakeRange(si, 40)];
//                    MTAssert(NO, @"UDID wrong formate, this should not happen, UDID = %@, UDID_source = %@", result, source);
//                    
//                    // 如果存进去正确的值，而取出来总是错的，那就不要再存了，所以这个逻辑只做一次
//                    static dispatch_once_t onceToken;
//                    dispatch_once(&onceToken, ^{
//                        [keychainItem setObject:result forKey:(__bridge id)kSecValueData];
//                        [[NSUserDefaults standardUserDefaults] setObject:result forKey:kBackupUDIDKey];
//                        [paste setData:[result dataUsingEncoding:NSASCIIStringEncoding] forPasteboardType:@"udid"];
//                    });
//                }
//            }
//        }
//        
//        // validate charactors
//        for (NSUInteger i=0; i<result.length; i++) {
//            char c = [result characterAtIndex:i];
//            if (c > 'z' || c < '0') {
//                [keychainItem setObject:nil forKey:(__bridge id)kSecValueData];
//                [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kBackupUDIDKey];
//                [paste setData:[NSData data] forPasteboardType:@"udid"];
//                
//                MTAssert(NO, @"UDID illegal character, this should not happen, UDID = %@, UDID_source = %@", result, source);
//                return nil;
//            }
//        }
//        
//        _udid = result;
//        
//        MTAssert(result.length > 0, @"empty UDID, this should not happen");
//    }
//    return _udid;
//}

- (NSString *)channelId {
    if (_channelId == nil) {
        NSString *channelIdPath = [[NSBundle mainBundle] pathForResource:@"channelId" ofType:@"data"];
        NSString *channelId = [[NSString stringWithContentsOfFile:channelIdPath encoding:NSUTF8StringEncoding error:nil] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (channelId) {
            _channelId = channelId;
        } else {
            _channelId = @"App Store";
        }
    }
    return _channelId;
}

- (NSDictionary *)clientInfo {
    if (_clientInfo == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        UIDevice *device = [UIDevice currentDevice];
        
        // open udid 和 idfa的区分: 个人感觉还是open udid好，虽然idfa可以直接用
        // https://segmentfault.com/a/1190000004444412
        
        _clientInfo = @{
                        @"platform": @"iPhone",
                        @"model": device.model,
                        @"os": device.systemVersion,
                        @"screen": [NSString stringWithFormat:@"%.fx%.f", screenSize.width, screenSize.height],
                        @"version": self.appVersion,
//                        @"udid": self.udid,
                        @"idfa": self.idfa,
                        @"bd": self.channelId,
                        @"dn": device.name,
                        @"app_name": self.appName,
                        };
    }
    // 如果不存在 尝试重新获取
    if (! _clientInfo[@"udid"]) {
        NSMutableDictionary *temp = [_clientInfo mutableCopy];
//        temp[@"udid"] = self.udid;
        _clientInfo = temp;
    }
    
    return _clientInfo;
}

- (NSString *)idfa {
    if (!_idfa) {
        _idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    return _idfa;
}

@end
