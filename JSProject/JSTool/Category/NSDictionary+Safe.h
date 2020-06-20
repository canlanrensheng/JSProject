//
//  NSDictionary+Safe.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

//#import <AppKit/AppKit.h>
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Safe)

- (NSString *)stringValueForKey:(id)key;
- (NSNumber *)numberValueForKey:(id)key;
- (NSUInteger)usingnedIntegerValueForKey:(id)key;
- (NSInteger)integerValueForKey:(id)key;
- (BOOL)boolValueForKey:(id)key;
- (CGFloat)floatValueForKey:(id)key;
- (NSDictionary *)dictValueForKey:(id)key;
- (NSArray *) arrayValueForKey:(id)key;

- (NSString *)safeStringValueForKey:(id)key defaultValue:(NSString *)defaultValue;
- (NSNumber *)safeNumberValueForKey:(id)key defaultValue:(NSNumber *)defaultValue;
- (NSUInteger)safeUnsignedIntegerValueForKey:(id)key defaultValue:(NSUInteger)defaultValue;
- (NSInteger)safeIntegerValueForKey:(id)key defaultValue:(NSInteger)defaultValue;
- (BOOL)safeBoolValueForKey:(id)key defaultValue:(BOOL)defaultValue;
- (CGFloat)safeFloatValueForKey:(id)key defaultValue:(CGFloat)defaultValue;
- (NSArray *)safeArrayValueForKey:(id)key defaultValue:(NSArray *)defaultValue;
- (NSDictionary *)safeDictionaryValueForKey:(id)key defaultValue:(NSDictionary *)defaultValue;

@end

NS_ASSUME_NONNULL_END
