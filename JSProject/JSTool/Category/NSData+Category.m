//
//  NSData+Category.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "NSData+Category.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

inline static NSString *fullToFourfoldString(NSString *string) {
    
    NSInteger shortLength = string.length - string.length / 4 * 4;
    NSString *result = string;
    for (NSInteger i = 0; i < shortLength; ++i) {
        result = [string stringByAppendingString:@"="];
    }
    return result;
}

@implementation NSData (Category)


- (NSString *)base64Encoding {
    return [self base64EncodingWithLineLength:0];
}

- (NSString *)base64EncodingWithLineLength:(NSUInteger)lineLength {
    NSDataBase64EncodingOptions options = 0;
    switch (lineLength) {
        case 64:
            options = NSDataBase64Encoding64CharacterLineLength;
            break;
        case 76:
            options = NSDataBase64Encoding76CharacterLineLength;
            break;
        default:
            break;
    }
    
    return [self base64EncodedStringWithOptions:options];
}

- (NSString *)base64Decoding {
    NSString *str = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:fullToFourfoldString(str) options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString*)md5 {
    const char *cStr = [self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    if(cStr)
    {
        CC_MD5( cStr, (CC_LONG)(self.length), result );
        return [[NSString stringWithFormat:
                 @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                 result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                 result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
                 ] lowercaseString];
    } else {
        return nil;
    }
}

- (NSString *)sha256 {
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for (int i=0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",digest[i]];
    }
    return ret;
}

@end
