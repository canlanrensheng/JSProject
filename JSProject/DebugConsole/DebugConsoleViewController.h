//
//  DebugConsoleViewController.h
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface DebugConsoleListModel: NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *value;
@property(nonatomic,assign)BOOL select;

@end

@interface DebugConsoleListCell : BaseTableViewCell

@property(nonatomic,strong)DebugConsoleListModel *model;

@end

@interface DebugConsoleViewController : BaseTableViewController

@end

NS_ASSUME_NONNULL_END
