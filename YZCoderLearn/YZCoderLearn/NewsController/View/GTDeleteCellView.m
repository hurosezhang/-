//
//  GTDeleteCellView.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/27.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTDeleteCellView.h"
@interface GTDeleteCellView ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, copy) dispatch_block_t deleteBlock;

@end

@implementation GTDeleteCellView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGestureReconginizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGestureReconginizer;
            })];

            _backgroundView.alpha = 0.5;
            _backgroundView;
        })];

        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_buttonClick) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }

    return self;
}

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock
{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [UIView animateWithDuration:1.0 animations:^{
//        _deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
//    }];
    _deleteBlock = [clickBlock copy];
    [UIView animateWithDuration:1.0f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
    } completion:^(BOOL finished) {
    }];
}

- (void)dismissDeleteView
{
    [self removeFromSuperview];
}

- (void)_buttonClick
{
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    [self removeFromSuperview];
}

@end
