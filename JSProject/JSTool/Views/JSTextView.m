//
//  JSTextView.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "JSTextView.h"
#import "UILabel+Create.h"
@interface JSTextView()<UITextViewDelegate>

@end

@implementation JSTextView

- (UITextView *)textView{
    if(!_textView){
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.delegate = self;
        
        _textView.font = [UIFont systemFontOfSize:14];
    }
    return _textView;
}

+ (instancetype)createTextViewWithFrame:(CGRect)frame
                        placeHoderFrame:(CGRect)placeHoderFrame
                         placeHoderText:(NSString *)placeHoderText
                       placeHolderColor:(UIColor *)placeHolderColor
                         placeHoderFont:(UIFont *)placeHoderFont
                               textFont:(UIFont *)textFont
                         showLimitLabel:(BOOL)showLimitLabel
                        limitCountFrame:(CGRect)limitCountFrame
                             limitCount:(NSInteger)limitCount
                        limitCountColor:(UIColor *)limitCountColor
                         limitCountFont:(UIFont *)limitCountFont {
    JSTextView *textView = [[JSTextView alloc] initWithFrame:frame placeHoderFrame:placeHoderFrame placeHoderText:placeHoderText placeHolderColor:placeHolderColor placeHoderFont:placeHoderFont textFont:textFont showLimitLabel:showLimitLabel limitCountFrame:limitCountFrame limitCount:limitCount limitCountColor:limitCountColor limitCountFont:limitCountFont];
    return textView;
}

/*
 description : 自定义uitextView 自定义placeHoder 不显示最大的数量
 placeHoderFrame : 自定义的占位的frame
 placeHoderText : 自定义的placeHoder的占位的文字
 placeHolderColor : 自定义的占位文字的字体的颜色
 placeHoderFont : 自定义的占位文字的字体
 textFont : 输入的文字的字体的大小
 */
+ (instancetype)createTextViewWithFrame:(CGRect)frame
                        placeHoderFrame:(CGRect)placeHoderFrame
                         placeHoderText:(NSString *)placeHoderText
                       placeHolderColor:(UIColor *)placeHolderColor
                         placeHoderFont:(UIFont *)placeHoderFont
                               textFont:(UIFont *)textFont {
    JSTextView *textView = [[JSTextView alloc] initWithFrame:frame placeHoderFrame:placeHoderFrame placeHoderText:placeHoderText placeHolderColor:placeHolderColor placeHoderFont:placeHoderFont textFont:textFont showLimitLabel:NO limitCountFrame:CGRectZero limitCount:0 limitCountColor:nil limitCountFont:nil];
    return textView;
}

- (instancetype)initWithFrame:(CGRect)frame
              placeHoderFrame:(CGRect)placeHoderFrame
               placeHoderText:(NSString *)placeHoderText
             placeHolderColor:(UIColor *)placeHolderColor
               placeHoderFont:(UIFont *)placeHoderFont
                     textFont:(UIFont *)textFont
               showLimitLabel:(BOOL)showLimitLabel
              limitCountFrame:(CGRect)limitCountFrame
                   limitCount:(NSInteger)limitCount
              limitCountColor:(UIColor *)limitCountColor
               limitCountFont:(UIFont *)limitCountFont{
    if (self = [super initWithFrame:frame]) {
        [self setUpWithFrame:frame  placeHoderFrame:placeHoderFrame placeHoderText:placeHoderText placeHolderColor:placeHolderColor placeHoderFont:placeHoderFont textFont:textFont showLimitLabel:showLimitLabel limitCountFrame:limitCountFrame limitCount:limitCount limitCountColor:limitCountColor limitCountFont:limitCountFont];
    }
    return self;
}

- (void)setUpWithFrame:(CGRect)frame
       placeHoderFrame:(CGRect)placeHoderFrame
         placeHoderText:(NSString *)placeHoderText
       placeHolderColor:(UIColor *)placeHolderColor
         placeHoderFont:(UIFont *)placeHoderFont
               textFont:(UIFont *)textFont
         showLimitLabel:(BOOL)showLimitLabel
        limitCountFrame:(CGRect)limitCountFrame
             limitCount:(NSInteger)limitCount
        limitCountColor:(UIColor *)limitCountColor
         limitCountFont:(UIFont *)limitCountFont {
    
    //设置textView
    self.textView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self addSubview:self.textView];
    
    //展位文字
    self.placeHoderLabel = [UILabel creatLabelWithFrame:CGRectMake(placeHoderFrame.origin.x, placeHoderFrame.origin.y, placeHoderFrame.size.width, placeHoderFrame.size.height) title:placeHoderText textColor:placeHolderColor textAlignment:NSTextAlignmentLeft font:placeHoderFont backGroundColor:[UIColor clearColor]];
    [self.textView addSubview:self.placeHoderLabel];
    
    _textView.textContainerInset = UIEdgeInsetsMake(0, placeHoderFrame.origin.x - 5, 0, 0);
    
    //显示输入的文字的最大的数量
    if(showLimitLabel) {
        self.maxCountLabel = [UILabel creatLabelWithFrame:CGRectMake(limitCountFrame.origin.x, limitCountFrame.origin.y, limitCountFrame.size.width, limitCountFrame.size.height) title:[NSString stringWithFormat:@"0/%ld",(long)limitCount] textColor:limitCountColor textAlignment:NSTextAlignmentRight font:limitCountFont backGroundColor:[UIColor clearColor]];
        [self.textView addSubview:self.maxCountLabel];
        
        self.showLimitString = YES;
        self.maxLimitCount = limitCount;
    }
}


- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.placeHoderLabel.hidden = NO;
    } else {
        self.placeHoderLabel.hidden = YES;
    }
    if(self.textViewChangeBlock) {
//        [self.textChangeSubject sendNext:textView.text];
        self.textViewChangeBlock(textView.text);
    }
    if(self.showLimitString) {
        if (_maxLimitCount && textView.text.length > _maxLimitCount) {
            textView.text = [textView.text substringToIndex:_maxLimitCount];
            return;
        }
        self.maxCountLabel.text = [NSString stringWithFormat:@"%lu/%ld",(unsigned long)textView.text.length,(long)_maxLimitCount];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    // 返回NO为禁用，YES为开启
    // 粘贴
    if (action == @selector(paste:)) return YES;
    // 剪切
    if (action == @selector(cut:)) return YES;
    // 复制
    if (action == @selector(copy:)) return YES;
    // 选择
    if (action == @selector(select:)) return YES;
    // 选中全部
    if (action == @selector(selectAll:)) return YES;
    // 删除
    if (action == @selector(delete:)) return YES;
    // 分享
    if (action == @selector(share)) return YES;
    return [super canPerformAction:action withSender:sender];
}

@end
