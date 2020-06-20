//
//  NSData+Category.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Category)

- (NSString *)base64Encoding;

- (NSString *)base64EncodingWithLineLength:(NSUInteger)lineLength;

- (NSString *)base64Decoding;

- (NSString *)md5;

- (NSString *)sha256;

@end

NS_ASSUME_NONNULL_END
