//
//  UIView+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)


@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;
/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

//找到自己的vc
- (UIViewController *_Nonnull)viewController;


@end

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Create)

/*
 description : 创建View视图切圆角
frame  : frame
cornerRadius : 半径
borderColor : 边框的颜色
borderWidth : 边框的宽度
**/
+ (UIView *)createViewWithFrame:(CGRect)frame
                             cornerRadius:(CGFloat)cornerRadius
                              borderColor:(UIColor *)borderColor
                              borderWidth:(CGFloat)borderWidth
                          backGroundColor:(UIColor *)backGroundColor;

/*
 descripetion : 创建view视图不切圆角
 frame : frame
 backGroundColor : 背景的颜色
 */
+ (UIView *)createViewWithFrame:(CGRect)frame
                backGroundColor:(UIColor *)backGroundColor;


/*
 descripetion : 切圆角
 cornerRadius : 半径
 borderColor : 边框颜色
 borderWidth : 边框的宽度
 */
- (void)clipWithCornerRadius:(CGFloat)cornerRadius borderColor:(id)borderColor borderWidth:(CGFloat)borderWidth;

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

/*设置顶部圆角*/
- (void)setCornerOnTop:(CGFloat )cornerRadius;

/*设置左边圆角*/
- (void)setCornerOnLeft:(CGFloat )cornerRadius;

/*设置右边圆角*/
- (void)setCornerOnRight:(CGFloat )cornerRadius;

//添加shadow
+ (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor;

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

@end

NS_ASSUME_NONNULL_END
