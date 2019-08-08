//
//  GTMediator.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/7.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

@interface GTMediator : NSObject
// target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl ;

// urlScheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);

+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params ;

// protocol calss
+ (void)registerProtol:(Protocol *)proto class:(Class )cls ;
+ (Class)classForPtotol:(Protocol *)proto;
@end

NS_ASSUME_NONNULL_END
