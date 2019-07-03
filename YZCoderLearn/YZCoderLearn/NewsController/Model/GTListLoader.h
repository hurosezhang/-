//
//  GTListLoader.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/1.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class GTListItem;
typedef void(^GTListLoaderFinshBlock)(BOOL success,NSArray<GTListItem *> *dataArray);
/**
 列表请求
 */
@interface GTListLoader : NSObject
- (void)loadlistDataWithFinshBlock:(GTListLoaderFinshBlock)finshBlock;
@end

NS_ASSUME_NONNULL_END
