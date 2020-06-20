//
//  BaseTableViewCell.m
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if([self respondsToSelector:@selector(setUpView)]) {
            [self setUpView];
        }
    }
    return self;
}


- (void)setUpView {
    
}


@end
