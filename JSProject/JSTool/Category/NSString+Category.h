//
//  NSString+Category.h
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/28.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ImageSizeType) {
    ImageSizeTypeDefault,    //250*250
    ImageSizeTypeThumbnail,  //80*80
    ImageSizeTypeFullScreen, //480*480
    ImageSizeTypeOriginal
};

@interface NSString (Category)

- (BOOL)isEmpty;
- (BOOL)validateMobile;
- (BOOL)validateUrl;
- (BOOL)validateEmail;
- (BOOL)containChinese;
- (NSString *)conversionFormat;
- (NSString *)conversionPriceFormat;
//处理空字符串
- (NSString *)validateString;
//验证车牌号
- (BOOL)validateCarNo;
- (NSString *)pinyin;
- (NSString *)pinyinInitial;
- (NSString *)dateConvertToYYMMDDHHMM;
- (NSString *)dateConvertToYYMMDDHHMMSS;
- (NSString *)dateConvertToYYMMDDHHMMSSLastTime;
- (NSString *)dateWithoutTConvertToYYMMDDHHMMSS;
- (NSString *)dateConvertToYYMMDD;
- (NSString *)dateConvertToHHMMSS;
- (NSString *)dateConvertToHHMM;
- (NSString *)dateConvertToMMDD;
- (NSString *)dateConvertToYYMMDDWithPoint;
- (NSString *)dateOfWeekDay;
+(NSString *)dealNullStringWithObject:(id)object;
- (NSString *)md5String;
+ (NSString *)uuid;
- (CGSize)sizeForFont:(UIFont *)font;
- (CGSize)sizeForFont:(UIFont*)font
    constrainedToSize:(CGSize)constraint
        lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;
- (CGFloat)calculateWidthWithSize:(CGSize)size font:(UIFont *)font;
- (CGSize)calculateSize:(CGSize)size lineSpace:(CGFloat)lineSpace font:(UIFont *)font;
- (CGSize)calculateAttributes:(NSDictionary *)attributes size:(CGSize)size;
- (NSAttributedString *)attributeWithStr:(NSString * )str color:(UIColor *)color font:(UIFont *)font;
- (NSAttributedString *)attributeWithStr:(NSString * )str color:(UIColor *)color font:(UIFont *)font withLastStringColor:(UIColor *)otherColor font:(UIFont *)otherFont;
//富文本操作
-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font;
-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font space:(CGFloat)space;
//unicode编码/解码
- (NSString *)encodePercentEscapeString;
- (NSString *)decodePercentEscapeString;
- (NSString *)imageUrlWithImageSize:(ImageSizeType)ImageSizeType;
//转json字符串
+ (NSString *)convertToJsonData:(NSDictionary *)dict;
//设置行间距
- (void)setLineSpacingWithLabel:(UILabel *)label space:(CGFloat)space;
//转json 字符串
- (NSString *)convertToJsonData:(NSDictionary *)dict;
//处理空字符串
- (NSString *)safeString;
//转换成整型字符串
- (NSString *)convertIntString;
//处理空字符串
- (NSString *)dealNullDataWithReplaceString:(NSString *)replaceString;
//处理日期的单个的数据
+ (NSString *)convertDateSingleData:(NSInteger)date;
//json对象转json字符串
+ (NSString *)objectToJson:(id)obj;
//json字符串转对象
+ (id)jsonToObject:(NSString *)json;

//加密
- (NSString *)base64Encoding;
- (NSString *)base64EncodingWithLineLength:(NSUInteger)lineLength;
- (NSString *)base64Decoding;
- (NSString *)md5;


@end

