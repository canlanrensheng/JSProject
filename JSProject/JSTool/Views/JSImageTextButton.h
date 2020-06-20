//
//  JSImageTextButton.h
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImageTextLayoutStyle) {
    ImageTextLayoutStylePositionLeft = 0, //左边图片右边文字
    ImageTextLayoutStylePositionRight,    //右边图片，左边文字
    ImageTextLayoutStylePositionTop,      //上边图片下边文字
    ImageTextLayoutStylePositionBottom    //上面文字下边图片
};

NS_ASSUME_NONNULL_BEGIN

@interface JSImageTextButton : UIButton

- (instancetype)initWithStyle:(ImageTextLayoutStyle)style
                      picSize:(CGSize)picSize
                     textSize:(CGSize)textSize
                      padding:(CGFloat)padding;

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *textLabel;

@end

NS_ASSUME_NONNULL_END
