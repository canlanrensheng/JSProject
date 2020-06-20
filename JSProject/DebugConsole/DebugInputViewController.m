//
//  DebugInputViewController.m
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "DebugInputViewController.h"

@implementation DebugInputListModel


@end


@interface DebugInputListCell ()<UITextFieldDelegate>

@property(nonatomic,strong)UILabel *titleItemLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)JSTextField *inputTextField;

@property(nonatomic,strong)DebugInputListModel *model;
@property(nonatomic,strong)NSIndexPath *indexPath;


@end

@implementation DebugInputListCell

- (void)setUpView {
    [self.contentView addSubview:self.titleItemLabel];
    [self.contentView addSubview:self.inputTextField];
    [self.contentView addSubview:self.lineView];
    
    [self.titleItemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kHeight(45));
        make.height.mas_equalTo(kHeight(18));
        make.left.mas_equalTo(self.contentView.mas_left).offset(kWidth(12));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kHeight(44));
        make.left.mas_equalTo(self.titleItemLabel.mas_right).offset(kWidth(8));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kWidth(12));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kWidth(12));
        make.right.equalTo(self.contentView).offset(-kWidth(12));
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(kHeight(0.5));
    }];
}

- (void)setModel:(DebugInputListModel *)model indexPath:(NSIndexPath *)indexPath {
    _model = model;
    _indexPath = indexPath;
    if (indexPath.row == 0) {
       self.titleItemLabel.text = @"名称：";
       NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:@"如:正式环境" attributes:@{NSForegroundColorAttributeName : HexApColor(0x000000, 0.3),NSFontAttributeName:RegularFont(font(15))  }];
       self.inputTextField.attributedPlaceholder= placeholderString;
    } else {
        self.titleItemLabel.text = @"域名：";
        NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:@"如:www.baidu.com" attributes:@{NSForegroundColorAttributeName : HexApColor(0x000000, 0.3),NSFontAttributeName:RegularFont(font(15))  }];
        self.inputTextField.attributedPlaceholder = placeholderString;
    }
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = HexColor(0xCCCCCC);
    }
    return _lineView;
}


- (UILabel *)titleItemLabel {
    if (!_titleItemLabel) {
        _titleItemLabel = [[UILabel alloc] init];
        _titleItemLabel.textAlignment = NSTextAlignmentLeft;
        _titleItemLabel.font = RegularFont(font(15));
        _titleItemLabel.textColor = HexColor(0x000000);
        _titleItemLabel.text = @"";
    }
    return _titleItemLabel;
}

- (JSTextField *)inputTextField {
    if (!_inputTextField) {
        _inputTextField = [[JSTextField alloc]init];
        _inputTextField.delegate = self;
        _inputTextField.font = RegularFont(font(15));
        _inputTextField.textAlignment = NSTextAlignmentLeft;
        [_inputTextField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        _inputTextField.keyboardType = UIKeyboardTypeDefault;
    }
    return _inputTextField;
}

- (void)textValueChanged:(UITextField *)textField {
    if (_indexPath.row == 0) {
        self.model.title = textField.text;
    } else {
        self.model.value = textField.text;
    }
}

@end

@interface DebugInputViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)DebugInputListModel *model;

@end

@implementation DebugInputViewController

- (DebugInputListModel *)model {
    if(!_model) {
        _model = [[DebugInputListModel alloc] init];
    }
    return _model;
}


- (UIView *)footerView {
    if(!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
    }
    return _footerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"调试控制台";
    
    [self setUpTableView:UITableViewStylePlain delegate:self cellIdentifiers:@[@"DebugInputListCell"] insets:UIEdgeInsetsMake(Height_NavBar, 0, 0, 0) needHeaderRefresh:YES needFooterRefresh:YES];
    self.tableView.backgroundColor = HexColor(0xF5F5F5);
    
    @weakify(self)
    UIButton *sureButton = [UIButton creatButtonWithFrame:CGRectZero title:@"确定" textColor:[UIColor whiteColor] font:RegularFont(17) backGroundColor:MainColor action:^(id  _Nonnull sender) {
        @strongify(self)
        if(!self.model.title.length){
            [self showHUDMessage:@"请输入名称"];
            return;
        }
        if(!self.model.value.length){
            [self showHUDMessage:@"请输入域名"];
            return;
        }
        if(self.addBlock) {
            self.addBlock(self.model.title, self.model.value);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [sureButton clipWithCornerRadius:6.0 borderColor:[UIColor clearColor] borderWidth:0];
    [self.footerView addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView);
        make.left.equalTo(self.footerView).offset(12);
        make.right.equalTo(self.footerView).offset(-12);
        make.height.mas_equalTo(50);
    }];
    self.tableView.tableFooterView = self.footerView;
    [self.tableView reloadData];
}

#pragma mark UITableView delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DebugInputListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DebugInputListCell" forIndexPath:indexPath];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:self.model indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row < self.dataArray.count) {
       
    }
}



@end

