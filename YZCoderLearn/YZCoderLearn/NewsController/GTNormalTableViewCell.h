//
//  GTNormalTableViewCell.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/12.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell
@property (nonatomic, weak) id<GTNormalTableViewCellDelegate> delegate;
- (void)layoutTableViewCell;
@end

NS_ASSUME_NONNULL_END
