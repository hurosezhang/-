//
//  GTVideoPlayer.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/25.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

/**
 单例负责音视频的播放
 */
@interface GTVideoPlayer : NSObject
+ (GTVideoPlayer *)player;

/**
 传入一个播放的url 和要播放的视图,封装播放动作

 @param videoUrl <#videoUrl description#>
 @param attachView <#attachView description#>
 */
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end

NS_ASSUME_NONNULL_END
