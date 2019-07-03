//
//  GTListLoader.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/1.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "GTListItem.h"
@implementation GTListLoader
- (void)loadlistDataWithFinshBlock:(GTListLoaderFinshBlock)finshBlock
{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];

//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];

    NSURLRequest *listRequest = [[NSURLRequest alloc]initWithURL:listURL ];

    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof (self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof (weakSelf)  strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
#warning 类型检查
        NSArray *dataArr = [((NSDictionary *)[(NSDictionary *)jsonObj objectForKey:@"result"]) objectForKey:@"data"];

        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArr) {
            GTListItem *listitem = [[GTListItem alloc] init];
            [listitem configWithDictionary:info];
            [listItemArray addObject:listitem];
        }
        
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        // 数据的回调最好在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
                       if (finshBlock) {
                           finshBlock(error == nil, listItemArray.copy);
                       }
                   });
    }];

    [dataTask resume];
}
- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    
    NSArray * pathAtt = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *cachesPath = [pathAtt firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 创建文件夹
    NSString * dataPath = [cachesPath stringByAppendingPathComponent:@"GTData"];
    NSError *cteateError ;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&cteateError];
    //创建文件
    NSString * listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData * listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    NSLog(@"");
    
    // 读取二进制l流
    NSData * readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil ];
    
    
    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    // 删除操作
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    
    
    
}
@end
