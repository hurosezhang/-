//
//  GTMediator.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/7.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTMediator.h"
@implementation GTMediator
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl
{
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controllerView = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl] ;
    return controllerView;
    
}
#pragma mark -

+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary * cache ;
    static dispatch_once_t onceToken ;
    dispatch_once(& onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock {
    
    if (scheme && processBlock) {
        [[self mediatorCache] setObject:processBlock forKey:scheme];
    }
    
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params  {
    GTMediatorProcessBlock block = [[self mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

+ (void)registerProtol:(Protocol *)proto class:(Class )cls  {
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+ (Class)classForPtotol:(Protocol *)proto {
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];

}
@end
