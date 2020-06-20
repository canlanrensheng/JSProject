//
//  UIButton+EnlargeTouchArea.h
//  ysscw_ios
//
//  Created by 张金山 on 2020/5/19.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EnlargeTouchArea)

//扩大按钮的点击区域
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end

NS_ASSUME_NONNULL_END
