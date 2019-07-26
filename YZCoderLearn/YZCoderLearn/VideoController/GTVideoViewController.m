//
//  GTVideoViewController.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/6.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTVideoViewController.h"
#import "GTVideoToolbar.h"
#import "GTVideoCoverView.h"

@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation GTVideoViewController
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.title = @"视频";
        self.view.backgroundColor= [UIColor blueColor];
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.itemSize = CGSizeMake((self.view.frame.size.width ), self.view.frame.size.width / 16 * 9 + GTVideoToolbarHeight );
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowlayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // ios 11才有, 一般用never 适配低版本
    collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    [self.view addSubview:collectionView];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        [(GTVideoCoverView *)cell layoutWithVideoCoverUrl:@"" videoUrl:@""];
    }
    return cell;
    
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.item % 3 == 0) {
//
//        return CGSizeMake(self.view.frame.size.width, 100);
//    }else {
//        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
