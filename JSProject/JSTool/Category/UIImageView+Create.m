//
//  UIImageView+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UIImageView+Create.h"

@implementation UIImageView (Create)

/*
 imageName  : 图片名字
 cornerRadius : 半径
 borderColor : 边框的颜色
 borderWidth : 边框的宽度
 **/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName
                                 cornerRadius:(CGFloat)cornerRadius
                                  borderColor:(id)borderColor
                                  borderWidth:(CGFloat)borderWidth {
    return [self createImageViewWithFrame:CGRectZero imageName:imageName cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
}

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
                         borderWidth:(CGFloat)borderWidth {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if(imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if(cornerRadius) {
        imageView.layer.cornerRadius = cornerRadius;
        imageView.layer.masksToBounds = YES;
    }
    if(borderColor) {
        imageView.layer.borderColor = ((UIColor *)borderColor).CGColor;
    }
    if(borderWidth) {
        imageView.layer.borderWidth = borderWidth;
    }
    return imageView;
}

/*
 frame  : frame
 imageName  : 图片名字
 **/
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                           imageName:(NSString *)imageName {
    UIImageView *imageView = [UIImageView createImageViewWithFrame:frame imageName:imageName cornerRadius:0 borderColor:[UIColor clearColor] borderWidth:0];
    return imageView;
}

/*
 imageName  : 图片名字
 **/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName {
    return [self creatImageViewWithFrame:CGRectZero imageName:imageName];
}

@end
