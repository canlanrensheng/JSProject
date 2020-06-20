//
//  UIImage+Category.h
//  HuiJingSchool
//
//  Created by 张金山 on 2018/10/18.
//  Copyright © 2018年 Junier. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

+ (UIImage*)imageWithColor:(UIColor*) color;

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)flipVertical;

/** 水平翻转 */
- (UIImage *)flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

//将图片裁剪成圆形
+ (instancetype)circleOldImage:(UIImage *)originalImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

//获取到图片的size
+ (CGSize)getImageSizeWithURL:(id)URL;

//图片置灰
+ (UIImage*)grayImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
