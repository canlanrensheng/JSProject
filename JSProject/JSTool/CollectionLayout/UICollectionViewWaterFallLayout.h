//
//  UICollectionViewWaterFallLayout.h
//  yssc_ios
//
//  Created by 张金山 on 2018/5/4.
//  Copyright © 2018年 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const UICollectionElementKindSectionHeader;
UIKIT_EXTERN NSString *const UICollectionElementKindSectionFooter;

@class UICollectionViewWaterFallLayout;

@protocol UICollectionViewWaterFallLayoutDelegate <NSObject>

@required
//计算item高度的代理方法，将item的高度与indexPath传递给外界
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

@optional
//区列数
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout colCountForSectionAtIndex:(NSInteger)section;

//区内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

//水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section;

//垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section;

//设置区头大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

//设置区尾大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

//设置分区颜色
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterFallLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section;

@end

@interface UICollectionViewWaterFallLayout : UICollectionViewLayout


//代理，用来计算item的高度
@property (nonatomic, weak) id<UICollectionViewWaterFallLayoutDelegate> delegate;

@property(nonatomic, assign) UIEdgeInsets sectionInset;//内边距
@property(nonatomic, assign) CGFloat lineSpacing;//行间距
@property(nonatomic, assign) CGFloat itemSpacing;//垂直间距
@property(nonatomic, assign) CGFloat colCount;//列数

@property (nonatomic) BOOL stickyHeader;

@end
