//
//  UIImageView+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Create)

/*
 imageName  : 图片名字
 cornerRadius : 半径
 borderColor : 边框的颜色
 borderWidth : 边框的宽度
 **/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName
                             cornerRadius:(CGFloat)cornerRadius
                              borderColor:(id)borderColor
                              borderWidth:(CGFloat)borderWidth;

/*
 frame  : frame
 imageName  : 图片名字
 cornerRadius : 半径
 borderColor : 边框的颜色
 borderWidth : 边框的宽度
 **/
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                           imageName:(NSString *)imageName
                        cornerRadius:(CGFloat)cornerRadius
                         borderColor:(id)borderColor
                         borderWidth:(CGFloat)borderWidth;


/*
 frame  : frame
 imageName  : 图片名字
 **/
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)imageName;

/*
 imageName  : 图片名字
 **/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
