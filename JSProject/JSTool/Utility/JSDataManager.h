//
//  JSDataManager.h
//  ysscw_ios
//
//  Created by 张金山 on 2020/1/8.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDataManager : NSObject

+ (JSDataManager *)shareManage;

- (void)writeObject:(id)object key:(NSString *)key;
- (id)readObjectForKey:(NSString *)key;
- (void)removeObjectWithKey:(NSString *)key;

- (void)archiveObject:(id)object withFileName:(NSString *)fileName;

- (id)unarchiveObjectWithFileName:(NSString *)fileName;
- (BOOL)existObjectForKey:(NSString *)key;
- (BOOL)existObjectForFileName:(NSString *)fileName;
- (BOOL)existObject:(id)object withKey:(NSString *)key;
- (BOOL)existObject:(id)object withFileName:(NSString *)fileName;
- (void)removeObjectWithFileName:(NSString *)fileName;


@end

NS_ASSUME_NONNULL_END
