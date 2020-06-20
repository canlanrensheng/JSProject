//
//  JSONSerialization.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "JSONSerialization.h"

@implementation JSONSerialization

+ (nullable NSData *)dataWithJSONObject:(nullable id)object {
    id input = [self sanitizedJSONObject:object];
    if (input == nil) {
        return nil;
    }
    return [NSJSONSerialization dataWithJSONObject:input options:0 error:nil];
}

+ (nullable NSString *)stringWithJSONObject:(nullable id)object {
    NSData *data = [self dataWithJSONObject:object];
    if (data == nil) {
        return nil;
    }

    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (nullable id)sanitizedJSONObject:(nullable id)object {
    if (object == nil) {
        return nil;
    }

    if ([object isKindOfClass:[NSDictionary class]]) {
        return [self sanitizedJSONDictionary:object];
    }

    if ([object isKindOfClass:[NSArray class]]) {
        return [self sanitizedJSONArray:object];
    }

    return nil;
}

+ (NSArray *)sanitizedJSONArray:(NSArray *)input {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:input.count];

    for (id obj in input) {
        id sanitized = [self sanitizedJSONValue:obj];
        if (sanitized != nil) {
            [result addObject:sanitized];
        }
    }

    return [result copy];
}

+ (NSDictionary *)sanitizedJSONDictionary:(NSDictionary *)input {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:input.count];

    for (id key in input) {
        if (![self isValidJSONKey:key]) {
            continue;
        }

        id sanitizedValue = [self sanitizedJSONValue:input[key]];
        if (sanitizedValue != nil) {
            result[key] = sanitizedValue;
        }
    }

    return [result copy];
}

+ (nullable id)sanitizedJSONValue:(id)value {
    // + [NSJSONSerialization isValidJSONObject:] 只接受顶层元素是 NSArray 和 NSDictionary
    // 而我们这里是要判断 value 可不可以作为一个合法的内层元素
    // 故把它放入一个数组中传递给 +isValidJSONObject: 去检查

    if ([value isKindOfClass:[NSNull class]] || ![NSJSONSerialization isValidJSONObject:@[value]]) {
        return nil;
    }

    if ([value isKindOfClass:[NSDictionary class]]) {
        return [self sanitizedJSONDictionary:value];
    } else if ([value isKindOfClass:[NSArray class]]) {
        return [self sanitizedJSONArray:value];
    }

    return value;
}

+ (BOOL)isValidJSONKey:(id)key {
    // 当且仅当 @{key: @""} 是一个合法的 JSON Object 时，
    // key 才是一个合法的 JSON key

    return [NSJSONSerialization isValidJSONObject:@{key: @""}];
}


@end
