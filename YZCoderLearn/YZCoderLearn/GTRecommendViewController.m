//
//  GTRecommendViewController.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/10.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

@end

@implementation GTRecommendViewController
- (instancetype)init {
    if (self = [super init]) {
        
        self.tabBarItem.title = @"推荐";
//        self.view.backgroundColor= [UIColor yellowColor];
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray * colorArr = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor lightGrayColor],[UIColor brownColor]];
    
    for (NSInteger i = 0; i < 5; i ++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i , 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            view.backgroundColor = [colorArr objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
