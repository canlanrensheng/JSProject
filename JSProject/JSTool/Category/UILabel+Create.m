//
//  UILabel+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)

/*
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 */
+ (UILabel *)creatLabelWithTitle:(NSString *)title
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment
                            font:(UIFont *)font {
    return [self creatLabelWithFrame:CGRectZero title:title textColor:textColor textAlignment:textAlignment font:font backGroundColor:[UIColor clearColor]];
}

/*
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 backGroundColor ：背景颜色
 */
+ (UILabel *)creatLabelWithTitle:(NSString *)title
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment
                            font:(UIFont *)font
                 backGroundColor:(UIColor *)backGroundColor {
    return [self creatLabelWithFrame:CGRectZero title:title textColor:textColor textAlignment:textAlignment font:font backGroundColor:backGroundColor];
}

/*
 frame  : frame
 title  : 标题
 textColor  : 标题的颜色
 textAlignment  : 对其方式
 font : 字体大小
 backGroundColor ：背景颜色
 */
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                           title:(NSString *)title
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment
                            font:(UIFont *)font
                 backGroundColor:(UIColor *)backGroundColor {
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    if(title) {
        label.text = title;
    }
    if(textColor) {
        label.textColor = textColor;
    }
    if(textAlignment) {
        label.textAlignment = textAlignment;
    }
    if(font) {
        label.font = font;
    }
    if(backGroundColor) {
        label.backgroundColor = backGroundColor;
    }
    return label;
}


//设置行间距
- (void)setLabelSpace:(CGFloat)space font:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:self.text attributes:dic];
    self.attributedText = attributeStr;
}

//字体的高度
- (CGFloat)fontHeight {
    return self.font.lineHeight;
}

//字间距
- (CGFloat)fontSpace {
    return MAX(0, self.font.lineHeight - self.font.pointSize);
}

@end
