//
//  JSDateTool.h
//  ysscw_ios
//
//  Created by 张金山 on 2020/4/3.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDateTool : NSObject

//时间转字符串
+ (NSString *)getTimeStringWithDate:(NSDate *)date;
//时间戳转字符串
+(NSString *)getTimeStringWithTimeStamp:(NSString *)timeStamp;
//时间转时间戳
+(NSString *)getTimeStampWithDate:(NSDate *)date;
//字符串转时间
+(NSDate *)getDateWithDateStr:(NSString *)dateStr;
//时间字符串转时间戳
+(NSString *)getTimeStampWithDateStr:(NSString *)dateStr;
//获取某一个正点的时间
+ (NSDate*)getCustomDateWithHour:(NSInteger)hour;
//获取一个日期之前或者之后多长时间的日期
+ (NSDate *)getLaterDateFromDate:(NSDate *)date withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minutes:(NSInteger)minutes second:(NSInteger)second;
//比较两个日期
+(int)compareDate:(NSDate *)date1 date:(NSDate *)date2;

@end

NS_ASSUME_NONNULL_END
