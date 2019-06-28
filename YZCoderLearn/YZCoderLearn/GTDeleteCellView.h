//
//  GTDeleteCellView.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/27.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
- (void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
