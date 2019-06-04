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
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
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
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}
- (void)loadView {
    [super loadView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestView * view = [[TestView alloc] init];
    view.frame = CGRectMake(150, 50, 100, 100);
    view.backgroundColor = [UIColor redColor];

    [self.view addSubview: view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushVC)];
    
    [view addGestureRecognizer:tapGesture];
    
}
- (void)pushVC {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
