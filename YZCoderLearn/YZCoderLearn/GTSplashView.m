//
//  GTSplashView.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/1.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"
@interface GTSplashView ()
@property (nonatomic, strong) UIButton *button;
@end
@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(320, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSolashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
            
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)_removeSolashView {
    [self removeFromSuperview];
}

@end
