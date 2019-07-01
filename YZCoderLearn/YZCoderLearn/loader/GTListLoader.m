//
//  GTListLoader.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/1.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTListLoader.h"

@implementation GTListLoader
- (void)loadlistData {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest * listRequest = [[NSURLRequest alloc]initWithURL:listURL ];
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    
    [dataTask resume];
    
}

@end
