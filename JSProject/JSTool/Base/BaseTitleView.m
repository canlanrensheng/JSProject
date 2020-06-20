//
//  BaseTitleView.m
//  ysscw_ios
//
//  Created by 张金山 on 2020/1/2.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import "BaseTitleView.h"

@implementation BaseTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15.f];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.textColor = [UIColor grayColor];
        _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
        _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_titleLabel];
        [self addSubview:_subtitleLabel];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat margin = 80.f;
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - margin * 2;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.width = MIN(self.titleLabel.width, maxWidth);
    
    [self.subtitleLabel sizeToFit];
    self.subtitleLabel.width = MIN(self.subtitleLabel.width, maxWidth);
    
    CGFloat width = MAX(self.titleLabel.width, self.subtitleLabel.width);
    return CGSizeMake(width, self.titleLabel.height + self.subtitleLabel.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.centerX = self.width * .5f;
    self.subtitleLabel.centerX = self.width * .5f;
    self.subtitleLabel.bottom  = self.height;
}

@end

