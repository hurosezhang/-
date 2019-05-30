//
//  ViewController.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/5/29.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView

@end
@implementation TestView

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow {
    [super didMoveToWindow];
}

@end
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:({
        TestView * view = [[TestView alloc] init];
        view.frame = CGRectMake(150, 50, 100, 100);
        view.backgroundColor = [UIColor redColor];
         view;
    } )];
}


@end
