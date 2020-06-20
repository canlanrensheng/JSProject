//
//  DebugInputViewController.h
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DebugInputListModel: NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *value;

@end

@interface DebugInputListCell : BaseTableViewCell

@property (nonatomic, copy) void(^textValueChangedBlock)(NSString *);

- (void)setModel:(DebugInputListModel *)model indexPath:(NSIndexPath *)indexPath;

@end

@interface DebugInputViewController : BaseTableViewController

@property (nonatomic, copy) void(^addBlock)(NSString *title,NSString *value);

@end

NS_ASSUME_NONNULL_END
