//
//  DebugConsoleViewController.m
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "DebugConsoleViewController.h"
#import "DebugInputViewController.h"

@implementation DebugConsoleListModel

@end

@interface DebugConsoleListCell ()

@property(nonatomic,strong)UILabel *itemTitleLabel;
@property(nonatomic,strong)UIButton *selectButton;
@property(nonatomic,strong)UIView *lineView;

@end

@implementation DebugConsoleListCell

- (UILabel *)itemTitleLabel {
    if(!_itemTitleLabel) {
        _itemTitleLabel = [UILabel creatLabelWithFrame:CGRectZero title:@"" textColor:HexColor(0x333333) textAlignment:NSTextAlignmentLeft font:RegularFont(16) backGroundColor:[UIColor clearColor]];
    }
    return _itemTitleLabel;
}

- (UIButton *)selectButton {
    if(!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectButton setImage:kImageName(@"ic_unselected") forState:UIControlStateNormal];
        [_selectButton setImage:kImageName(@"ic_selected") forState:UIControlStateSelected];
        _selectButton.userInteractionEnabled = NO;
    }
    return _selectButton;
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = HexColor(0xCCCCCC);
    }
    return _lineView;
}

- (void)setUpView {
    [self.contentView addSubview:self.itemTitleLabel];
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.lineView];
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.selectButton.mas_left).offset(-12);
    }];
        
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)setModel:(DebugConsoleListModel *)model {
    _model = model;
    if(model) {
        self.itemTitleLabel.text = [NSString stringWithFormat:@"%@：%@",model.title,model.value];
        self.selectButton.selected = model.select;
    }
}

@end

@interface DebugConsoleViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton *sureButton;
@property (nonatomic,strong) DebugConsoleListModel *lastSelectModel;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSMutableArray *tempArray;

@end

@implementation DebugConsoleViewController

- (UIButton *)sureButton {
    if(!_sureButton) {
        @weakify(self)
        _sureButton = [UIButton creatButtonWithFrame:CGRectZero title:@"切换" textColor:[UIColor whiteColor] font:RegularFont(17) backGroundColor:MainColor action:^(id  _Nonnull sender) {
            @strongify(self)
            [HelperUtil showAlertController:self alertTitle:@"温馨提示" message:@"为防止切换环境后出现不可描述的问题，请先退出再打开APP" actionTiles:@[@"确定"] complainHandler:^(NSInteger index) {
                
            }];
        }];
    }
    return _sureButton;
}

- (UIView *)footerView {
    if(!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
    }
    return _footerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"调试控制台";
    
    [self setUpTableView:UITableViewStylePlain delegate:self cellIdentifiers:@[@"DebugConsoleListCell"] insets:UIEdgeInsetsMake(Height_NavBar, 0, 48, 0) needHeaderRefresh:YES needFooterRefresh:YES];
    self.tableView.backgroundColor = HexColor(0xF5F5F5);
    
    @weakify(self)
    UIButton *diyButton = [UIButton creatButtonWithFrame:CGRectZero title:@"自定义" textColor:MainColor font:RegularFont(13) backGroundColor:[UIColor clearColor] action:^(id  _Nonnull sender) {
       @strongify(self)
       DebugInputViewController *diyVC = [[DebugInputViewController alloc] init];
       [self.navigationController pushViewController:diyVC animated:YES];
       diyVC.addBlock = ^(NSString * _Nonnull title, NSString * _Nonnull value) {
           DebugConsoleListModel *model = [[DebugConsoleListModel alloc] init];
           model.title = title;
           model.value = value;
           [self.dataArray addObject:model];
           
           //写入plist里面
           NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"DebugConsoleList.plist"];
           NSFileManager *fileManager = [NSFileManager defaultManager];
           BOOL exists = [fileManager fileExistsAtPath:fileName];
           if(!exists){
               NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"DebugConsoleList" ofType:@".plist"];
               NSError *error;
               BOOL success = [fileManager copyItemAtPath:plistPath toPath: fileName error:&error];
               if(!success){
                   NSLog(@"copy失败");
               }
           }
           NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
           [dataDic setObject:model.title forKey:@"title"];
           [dataDic setObject:model.value forKey:@"value"];
           [self.tempArray addObject:dataDic];
           BOOL success = [self.tempArray writeToFile:fileName atomically:YES];
           if (success) {
               [self showHUDMessage:@"写入成功"];
           } else {
               [self showHUDMessage:@"写入失败"];
           }
           [self.tableView reloadData];
       };
    }];
    [self.footerView addSubview:diyButton];
    [diyButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(self.footerView);
       make.right.equalTo(self.footerView).offset(-12);
    }];
    self.tableView.tableFooterView = self.footerView;
    
    [self.view addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(48);
    }];
    
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"DebugConsoleList.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL exists = [fileManager fileExistsAtPath:fileName];
    if(!exists){
       NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"DebugConsoleList" ofType:@".plist"];
       NSError *error;
       BOOL success = [fileManager copyItemAtPath:plistPath toPath: fileName error:&error];
       if(!success){
           NSLog(@"copy失败");
       }
    }
    NSArray *tempArray = [NSArray arrayWithContentsOfFile:fileName];
    self.tempArray = [NSMutableArray arrayWithArray:tempArray];
    self.dataArray = [DebugConsoleListModel mj_objectArrayWithKeyValuesArray:tempArray];
    [self.tableView reloadData];
}

#pragma mark UITableView delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DebugConsoleListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DebugConsoleListCell" forIndexPath:indexPath];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row < self.dataArray.count) {
        [cell setModel:self.dataArray[indexPath.row]];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row < self.dataArray.count) {
        DebugConsoleListModel *model = self.dataArray[indexPath.row];
        self.lastSelectModel.select = NO;
        model.select = YES;
        self.lastSelectModel = model;
        [self.tableView reloadData];
    }
}



@end
