//
//  GTNormalTableViewCell.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/12.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GTListItem ;

@protocol GTNormalTableViewCellDelegate <NSObject>

/**
 点击删除按钮

 @param tableViewCell <#tableViewCell description#>
 @param deleteButton <#deleteButton description#>
 */
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

/**
 新闻列表Cell
 */
@interface GTNormalTableViewCell : UITableViewCell
@property (nonatomic, weak) id<GTNormalTableViewCellDelegate> delegate;
- (void)layoutTableViewCellWithItem:(GTListItem *)item;
@end

NS_ASSUME_NONNULL_END
