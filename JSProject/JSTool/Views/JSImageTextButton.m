//
//  JSImageTextButton.m
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "JSImageTextButton.h"

@interface JSImageTextButton ()

@property (nonatomic,strong) UIView *backView;

@end


@implementation JSImageTextButton

- (UIView *)backView {
    if(!_backView) {
        _backView = [[UIView alloc] init];
        _backView.userInteractionEnabled = NO;
    }
    return _backView;
}

- (UIImageView *)imageV {
    if(!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.userInteractionEnabled = YES;
    }
    return _imageV;
}

- (UILabel *)textLabel {
    if(!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

- (instancetype)initWithStyle:(ImageTextLayoutStyle)style
                      picSize:(CGSize)picSize
                     textSize:(CGSize)textSize
                      padding:(CGFloat)padding {
    if(self = [super init]) {
        [self setUpViewWithStyle:style picSize:picSize textSize:textSize padding:padding];
    }
    return self;
}

- (void)setUpViewWithStyle:(ImageTextLayoutStyle)style
                   picSize:(CGSize)picSize
                  textSize:(CGSize)textSize
                   padding:(CGFloat)padding {
    switch (style) {
        case ImageTextLayoutStylePositionTop: {
           
            CGFloat maxWidth = MAX(picSize.width, textSize.width);
            CGFloat height = picSize.height + textSize.height + padding;
            [self addSubview:self.backView];
            [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(maxWidth, height));
                make.center.equalTo(self);
            }];
            
            [self addSubview:self.imageV];
            [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(picSize);
                make.centerX.equalTo(self.backView);
                make.top.equalTo(self.backView);
            }];
            
            [self addSubview:self.textLabel];
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.imageV);
                make.top.equalTo(self.imageV.mas_bottom).offset(padding);
                make.size.mas_equalTo(textSize);
            }];
        }
            break;
        case ImageTextLayoutStylePositionBottom: {
            //上面文字下边图片
            CGFloat maxWidth = MAX(picSize.width, textSize.width);
            CGFloat height = picSize.height + textSize.height + padding;
            [self addSubview:self.backView];
            [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(maxWidth, height));
                make.center.equalTo(self);
            }];
            
            [self addSubview:self.textLabel];
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(textSize);
                make.centerX.equalTo(self.backView);
                make.top.equalTo(self.backView);
            }];
            
            [self addSubview:self.imageV];
            [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.textLabel);
                make.top.equalTo(self.textLabel.mas_bottom).offset(padding);
                make.size.mas_equalTo(picSize);
            }];

        }
            break;
        case ImageTextLayoutStylePositionLeft: {
            //左边图片右边文字
            CGFloat maxHeight = MAX(picSize.height, textSize.height);
            CGFloat width = picSize.width + textSize.width + padding;
            [self addSubview:self.backView];
            [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(width, maxHeight));
                make.center.equalTo(self);
            }];
            
            [self addSubview:self.imageV];
            [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(picSize);
                make.centerY.equalTo(self.backView);
                make.left.equalTo(self.backView);
            }];
            
            [self addSubview:self.textLabel];
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.imageV);
                make.left.equalTo(self.imageV.mas_right).offset(padding);
                make.size.mas_equalTo(textSize);
            }];
        }
            break;
        case ImageTextLayoutStylePositionRight: {
            //右边图片，左边文字
            CGFloat maxHeight = MAX(picSize.height, textSize.height);
            CGFloat width = picSize.width + textSize.width + padding;
            [self addSubview:self.backView];
            [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(width, maxHeight));
                make.center.equalTo(self);
            }];
            
            [self addSubview:self.textLabel];
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(textSize);
                make.centerY.equalTo(self.backView);
                make.left.equalTo(self.backView);
            }];
            
            [self addSubview:self.imageV];
            [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.textLabel);
                make.left.equalTo(self.textLabel.mas_right).offset(padding);
                make.size.mas_equalTo(picSize);
            }];
        }
            break;
            
        default:
            break;
    }
}


@end
