//
//  JSDataManager.m
//  ysscw_ios
//
//  Created by 张金山 on 2020/1/8.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import "JSDataManager.h"

@implementation JSDataManager

+ (JSDataManager*)shareManage {
    static  JSDataManager * manage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage = [[JSDataManager alloc] init];
    });
    return manage;
}

- (void)writeObject:(id)object key:(NSString *)key {
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:object forKey:key];
    [df synchronize];
}

- (id)readObjectForKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:key];
}

- (void)archiveObject:(id)object withFileName:(NSString *)fileName{
    NSString *localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    [NSKeyedArchiver archiveRootObject:object toFile:localPath];
}



- (id)unarchiveObjectWithFileName:(NSString *)fileName{
    NSString *localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:localPath];
}

- (BOOL)existObjectForKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud objectForKey:key]) {
        return YES;
    }
    return NO;
}

- (BOOL)existObjectForFileName:(NSString *)fileName{
    NSString *localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager fileExistsAtPath:localPath]){
        return YES;
    }
    return NO;
}

- (BOOL)existObject:(id)object withKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *array = [ud objectForKey:key];
    if ([array containsObject:object]) {
        return YES;
    }
    return NO;
}

- (BOOL)existObject:(id)object withFileName:(NSString *)fileName{
    NSString *localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:localPath];
    if ([array containsObject:object]) {
        return YES;
    }
    return NO;
}

- (void)removeObjectWithFileName:(NSString *)fileName{
    NSString *localPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:localPath]) {
        [defaultManager removeItemAtPath:localPath error:nil];
    }
}

- (void)removeObjectWithKey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    if ([user objectForKey:key]) {
        [user removeObjectForKey:key];
        [user synchronize];
    }
}

@end

