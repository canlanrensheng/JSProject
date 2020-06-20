//
//  NSDictionary+Safe.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "NSDictionary+Safe.h"


@implementation NSDictionary (Safe)

- (NSString *)stringValueForKey:(id)key {
#ifndef DEBUG
    return [self safeStringValueForKey:key defaultValue:nil];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    return nil;
#endif
}

- (NSNumber *)numberValueForKey:(id)key {
#ifndef DEBUG
    return [self safeNumberValueForKey:key defaultValue:nil];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    return nil;
#endif
}

- (NSDictionary *)dictValueForKey:(id)key {
#ifndef DEBUG
    return [self safeDictionaryValueForKey:key defaultValue:nil];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
#endif
}

- (NSArray *)arrayValueForKey:(id)key {
#ifndef DEBUG
    return [self safeArrayValueForKey:key defaultValue:nil];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
#endif
}

- (NSUInteger)usingnedIntegerValueForKey:(id)key {
#ifndef DEBUG
    return [self safeUnsignedIntegerValueForKey:key defaultValue:0];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
#endif
}

- (NSInteger)integerValueForKey:(id)key {
#ifndef DEBUG
    return [self safeIntegerValueForKey:key defaultValue:0];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
#endif
}

- (BOOL)boolValueForKey:(id)key {
#ifndef DEBUG
    return [self safeBoolValueForKey:key defaultValue:NO];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    return NO;
#endif
}

- (CGFloat)floatValueForKey:(id)key {
#ifndef DEBUG
    return [self safeFloatValueForKey:key defaultValue:NO];
#else
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    return 0;
#endif
}

- (NSString *)safeStringValueForKey:(id)key defaultValue:(NSString *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else {
        return [NSString stringWithFormat:@"%@", value];
    }
}

- (NSNumber *)safeNumberValueForKey:(id)key defaultValue:(NSNumber *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        return @([value doubleValue]);
    } else {
        return defaultValue;
    }
}

- (NSUInteger)safeUnsignedIntegerValueForKey:(id)key defaultValue:(NSUInteger)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return (NSUInteger)[value integerValue];
    } else {
        return defaultValue;
    }
}

- (NSInteger)safeIntegerValueForKey:(id)key defaultValue:(NSInteger)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    } else {
        return defaultValue;
    }
}

- (BOOL)safeBoolValueForKey:(id)key defaultValue:(BOOL)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    } else {
        return defaultValue;
    }
}

- (CGFloat)safeFloatValueForKey:(id)key defaultValue:(CGFloat)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    } else {
        return defaultValue;
    }
}

- (NSArray *)safeArrayValueForKey:(id)key defaultValue:(NSArray *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSArray class]]) {
        return value;
    } else {
        return defaultValue;
    }
}

- (NSDictionary *)safeDictionaryValueForKey:(id)key defaultValue:(NSDictionary *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    } else {
        return defaultValue;
    }
}

@end
