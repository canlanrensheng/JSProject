//
//  JSMenuTextView.m
//  ysscw_ios
//
//  Created by 张金山 on 2020/5/9.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import "JSMenuTextView.h"

@implementation JSMenuTextView

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(cut:) && self.text.length > 0) {
        return  YES;
    }
    if (action == @selector(copy:)  && self.text.length > 0) {
        return  YES;
    }
    if (action == @selector(select:)  && self.text.length > 0) {
        return  YES;
    }
    if (action == @selector(selectAll:)  && self.text.length > 0) {
           return  YES;
    }
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    if (action == @selector(paste:) && board.string.length > 0) {
        return  YES;
    }
    return NO;
}

@end
