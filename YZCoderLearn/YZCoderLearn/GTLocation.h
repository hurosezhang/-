//
//  GTLocation.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/13.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 app 中统一的位置管理
 */
@interface GTLocation : NSObject
+ (GTLocation *)locationManager ;
- (void)checkLocationAuthorization ;
@end

NS_ASSUME_NONNULL_END
