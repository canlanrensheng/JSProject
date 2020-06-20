//
//  BaseTableViewController.m
//  ysscw_ios
//
//  Created by 张金山 on 2019/12/29.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigation];
    [self setUpView];
    [self addObserver];
    [self loadData];
}


- (void)setUpTableView:(UITableViewStyle)style
              delegate:(id)delegate
       cellIdentifiers:(NSArray *)cellIdentifiers
                insets:(UIEdgeInsets)insets
     needHeaderRefresh:(BOOL)needHeaderRefresh
     needFooterRefresh:(BOOL)needFooterRefresh {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                              style:style];
    _tableView.delegate = delegate;
    _tableView.dataSource = delegate;
    _tableView.emptyDataSetSource = delegate;
    _tableView.emptyDataSetDelegate = delegate;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 0.00001f)];
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 0.00001f)];
    _tableView.backgroundColor = HexColor(0xededed);
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.userInteractionEnabled = YES;
    
    if (@available(iOS 11.0, *)) {
       _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    //注册
    for (int i = 0;i < cellIdentifiers.count;i++) {
        [_tableView registerClass:NSClassFromString(cellIdentifiers[i])
           forCellReuseIdentifier:cellIdentifiers[i]];
    }
    //添加视图
    UIViewController *vc = (UIViewController *)delegate;
    [vc.view addSubview:_tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(vc.view).insets(insets);
    }];
    
    if(needHeaderRefresh) {
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    }
    
    if(needFooterRefresh) {
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    }
    _tableView.mj_footer.hidden = YES;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)setUpNavigation {}

- (void)setUpView {}

- (void)addObserver {}

- (void)loadData {}


//上拉加载
- (void)footerRefresh {}

//下拉刷新
- (void)headerRefresh {}

#pragma mark UITableViewDelagate

#pragma mark - DZNEmptyDataSetSource
//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
//    return [UIImage imageNamed:@"img_empty_news"];
//}
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *text = [NSString stringWithFormat:@""];
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:RegularFont(14),NSFontAttributeName,LightTextColor,NSForegroundColorAttributeName, nil];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text attributes:attributes];
//    return attributedString;
//}
//
//#pragma mark - DZNEmptyDataSetDelegate Methods
//- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
//    return YES;
//}

//
//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
//    return Background_Color;
//}
//
//- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
//    return 24.0f;
//}

@end
