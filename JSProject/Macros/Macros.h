//
//  Macros.h
//  ysscw_ios
//
//  Created by 张金山 on 2018/5/21.
//  Copyright © 2018年 ysscw. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define BaseUrl      @"https://51ysscw.com/app/"

#define WeChatAppKey      @"wx07639c69c0192c57"
#define WeChatAppSecret   @"9128cccbea655e783dbfa4690d1e3fb2"
#define QQAppId           @"1106087070"
#define QQAppKey          @"8kyiGY6p39qFCkTG"
#define WeiboAppKey       @"4030964832"
#define WeiboAppSecret    @"bb802413d5d59a2d8b8c4c6f02a7fbd3"
#define UMAppKey          @"5dd632e70cafb2366f000100"
#define BuglyAppId         @"85b9d66349"
#define WXSmallProgramId   @"gh_6e4f3c8fca83"

#define JPushAppKey        @"b204443fb868b35671e92bbe"

#define GeYanAppKey        @"hkqrnhzQ3u7fyJtLO2V8R9"

#define NIMKey             @"f8a1497297ff9bcef226adcc3261ea04"


//用户信息
#define User_Data_Path [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user_data"] stringByAppendingPathExtension:@"ys"]

#define KHomeSearchPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"home_search_history.data"]

#define KHelpSearchPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"help_search_history.data"]

#define ACWeakSelf __weak typeof(self) weakSelf = self;

#define weakStrongSelf  self->

//当前版本
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//build
#define Builid  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

//系统版本
#define SysVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//获取bundleId
#define BundleIdentifier [[NSBundle mainBundle] bundleIdentifier]

//判断字符串是否为空
#define kStringIsEmpty(string) (string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

//判断数组是否为空
#define kArrayIsEmpty(array)  (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)


#define kImageName(name) [UIImage imageNamed:name]

//字体
#define RegularFont(s) [UIFont fontWithName:@"PingFangSC-Regular" size:s]
#define MediumFont(s) [UIFont fontWithName:@"PingFangSC-Medium" size:s]

//RGB色值
//#define RGBValue(rgbValue) \
//[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
//green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
//blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//#define HexApColor(hex,alpha) [UIColor colorWithHex:hex alpha:alpha]


#define HexColor(hex) [UIColor colorWithHex:hex]
#define HexApColor(hex, a) [UIColor colorWithHex:hex alpha:a]

//颜色
#define NavBarTintColor HexColor(0xA00000)
//#define MainColor       HexColor(0xA80015)
#define MainColor       HexColor(0xA00000)

//2019猪年主题色
//#define NavBarTintColor HexColor(0xC40C0A)
//#define MainColor       HexColor(0xC40C0A)

#define DeepTextColor   HexColor(0x333333)
#define NormalTextColor HexColor(0x666666)
#define LightTextColor  HexColor(0x999999)

#define BreakLineColor  HexColor(0xD8D8D8)
#define BackGroundColor HexColor(0xEFEFF4)

#define PlaceholderColor HexColor(0x888888)

//屏幕大小
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height

#define WIDTH_RATE   SCREEN_W/375
#define HEIGHT_RATE  SCREEN_H/667


#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define TabBarItem_Top ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 15.0 : 0.0)


#define KIsIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#ifdef DEBUG

#define NSSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSSLog(...)

#endif

#define kIphoneBottomHeight KIsIphoneX * 34.0

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define SizeScale           (kiPhone6Plus ? 2 : 0)
#define kFontSize(value)    value + 2

#define kWidth(R) (R)*(SCREEN_W)/375
#define kHeight(R) (R)*(SCREEN_W)/375
#define font(R) (R)*(SCREEN_W)/375

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#endif /* Macros_h */
