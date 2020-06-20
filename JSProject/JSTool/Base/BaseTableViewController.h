//
//  BaseTableViewController.h
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController


@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArray;

//配置tableView
- (void)setUpTableView:(UITableViewStyle)style
              delegate:(id)delegate
       cellIdentifiers:(NSArray *)cellIdentifiers
                insets:(UIEdgeInsets)insets
     needHeaderRefresh:(BOOL)needHeaderRefresh
     needFooterRefresh:(BOOL)needFooterRefresh;


//初始化导航控制器
- (void)setUpNavigation;

//加载视图
- (void)setUpView;

//加载数据
- (void)loadData;

//添加通知
- (void)addObserver;

//上拉加载
- (void)footerRefresh;

//下拉刷新
- (void)headerRefresh;

@end

NS_ASSUME_NONNULL_END
