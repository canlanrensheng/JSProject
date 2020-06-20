//
//  BaseView.m
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = BackGroundColor;
        if([self respondsToSelector:@selector(setUpView)]) {
            [self setUpView];
        }
    }
    return self;
}

- (void)setUpView {
    
}

@end
