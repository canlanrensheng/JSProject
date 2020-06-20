//
//  JSONSerialization.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSONSerialization : NSObject

/**
 把字典、数组转成 JSON 格式的 Data

 忽略其中无法转化成 JSON 的字段及 NSNull

 @param object 字典、数组等 NSJSONSerialization 支持的类型的数据
 @return JSON 数据
 */
+ (nullable NSData *)dataWithJSONObject:(nullable id)object;

/**
 把字典、数组转成 JSON 格式的字符串

 忽略其中无法转化成 JSON 的字段及 NSNull

 @param object 字典、数组等 NSJSONSerialization 支持的类型的数据
 @return JSON 字符串
 */
+ (nullable NSString *)stringWithJSONObject:(nullable id)object;

/**
 把字典、数组等转成可以 JSON 序列化的数据，忽略其中无法转化成 JSON 的字段及 NSNull
 */
+ (nullable id)sanitizedJSONValue:(id)value;

@end

NS_ASSUME_NONNULL_END
