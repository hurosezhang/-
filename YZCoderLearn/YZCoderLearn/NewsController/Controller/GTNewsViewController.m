//
//  GTNewsViewController.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/5/29.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
//#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"
#import "GTMediator.h"
#import "GTSearchBar.h"
#import "GTScreen.h"
#import "GTCommentManager.h"

@interface TestView : UIView

@end
@implementation TestView
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
}

@end
@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) GTListLoader *listLoader;
@end

@implementation GTNewsViewController
#pragma mark - lefe clycle
- (instancetype)init
{
    if (self = [super init]) {
   
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBar.barTintColor= [UIColor redColor];
    [self.tabBarController.navigationItem setTitleView:({
//        GTSearchBar * searchBar = [[GTSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20),  self.navigationController.navigationBar.bounds.size.height)];
//        searchBar ;
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
                button.backgroundColor = [UIColor lightGrayColor];
                [button addTarget:self action:@selector(_showCommentView) forControlEvents:UIControlEventTouchUpInside];
                button;

        
    })];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    UITableView *tableView =  [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    self.listLoader = [[GTListLoader alloc] init];
    __weak typeof(self)wself = self;
    [self.listLoader loadlistDataWithFinshBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(self) strongself = self;
        strongself.dataArr = dataArray;
        [strongself.tableView reloadData];
        NSLog(@"");
    }];
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTListItem *item = [self.dataArr objectAtIndex:indexPath.row];
//    __kindof UIViewController *controllerView = [GTMediator detailViewControllerWithUrl:item.articleUrl];
//    GTDetailViewController *controllerView = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    
//    controllerView.title = [NSString stringWithFormat:@"主标题%@", @(indexPath.row)];
//    [self.navigationController pushViewController:controllerView animated:YES];
    
//    [GTMediator openUrl:@"detail://" params:@{@"url":  item.articleUrl,@"controller" : self.navigationController}];
    Class cls = [GTMediator classForPtotol:@protocol(GTDetailViewControllerProtocol)];
    [self.navigationController pushViewController:[[cls alloc] detailViewControllerWithUrl:item.articleUrl] animated:YES];

    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniqueKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (cell == nil) {
        cell =  [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:[self.dataArr objectAtIndex:indexPath.row]];
//    cell.textLabel.text = [NSString stringWithFormat:@"主标题%@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton
{
//    GTDeleteCellView *deleteCellView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//    __weak typeof(self)wself = self;
//    [deleteCellView showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(self) strongself = self;
//        [strongself.dataArr removeLastObject];
//        [strongself.tableView deleteRowsAtIndexPaths:@[[strongself.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}
#pragma mark -

- (void)_showCommentView{
    [[GTCommentManager sharedManager] showCommentView];
}
@end
