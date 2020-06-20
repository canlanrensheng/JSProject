//
//  JSTextView.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSTextView : UIView

/*
 使用参考
 JSTextView *textView = [JSTextView createTextViewWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100) placeHoderFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 15) placeHoderText:@"请输入文字" placeHolderColor:[UIColor lightGrayColor] placeHoderFont:[UIFont systemFontOfSize:14] textFont:[UIFont systemFontOfSize:14] showLimitLabel:YES limitCountFrame:CGRectMake(10, 100 - 15, [UIScreen mainScreen].bounds.size.width - 20, 15) limitCount:100 limitCountColor:[UIColor lightGrayColor] limitCountFont:[UIFont systemFontOfSize:14]];
 
 */


/*
 description : 自定义uitextView 自定义placeHoder 可以显示最大的数量限制
 placeHoderFrame : 自定义的占位的frame
 placeHoderText : 自定义的placeHoder的占位的文字
 placeHolderColor : 自定义的占位文字的字体的颜色
 placeHoderFont : 自定义的占位文字的字体
 textFont : 输入的文字的字体的大小
 showLimitLabel : 是否显示最大的数量限制
 limitCountFrame : 最大数量的视图的frame
 limitCount : 最大输入的文字的数量
 limitCountColor : 最大输入文字的字体颜色
 limitCountFont : 最大输入文字的字体
 */
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
                                limitCountFont:(UIFont *)limitCountFont;


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
                               textFont:(UIFont *)textFont;


//输入文本
@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) UILabel *placeHoderLabel;

@property (nonatomic,strong) UILabel *maxCountLabel;

@property (nonatomic,assign) BOOL showLimitString;

@property (nonatomic,assign) NSInteger maxLimitCount;

@property (nonatomic, copy) void (^textViewChangeBlock)(NSString *text);



@end

NS_ASSUME_NONNULL_END
