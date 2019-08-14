//
//  GTCommentManager.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/14.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject
+ (GTCommentManager *)sharedManager;

- (void)showCommentView;

@end

NS_ASSUME_NONNULL_END
