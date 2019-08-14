//
//  TodayViewController.m
//  GTToday
//
//  Created by jonzhang on 2019/8/14.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"点击跳转" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(_openSimpleApp) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(100, 0, 200, 100);
        btn;
    })];
}
- (void)_openSimpleApp {
    
    [self.extensionContext openURL:[NSURL URLWithString:@"GTTest://"] completionHandler:^(BOOL success) {
        
        
    }];
    
}
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
