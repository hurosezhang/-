//
//  GTVideoPlayer.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/25.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoPlayer ()
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *videoItem;

@end
@implementation GTVideoPlayer
+ (GTVideoPlayer *)player {
    static GTVideoPlayer * player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView {
    
    // 确保只有一个播放器,将原来的播放器销毁掉
    [self _stopPlay];
    
   NSString * _videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    NSURL * vidUrl = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:vidUrl];
    AVPlayerItem * videoItem = [AVPlayerItem playerItemWithAsset:asset];
    CMTime duation = _videoItem.duration;
    CGFloat videoDuation =  CMTimeGetSeconds(duation);
    
    [videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    AVPlayer *avplayer  = [AVPlayer playerWithPlayerItem:videoItem];
    [avplayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度 %lf", CMTimeGetSeconds(time));
        
    }];
    AVPlayerLayer * payerLayer = [AVPlayerLayer playerLayerWithPlayer:avplayer];
    _videoItem = videoItem;
    _avPlayer = avplayer;
    _playerLayer = payerLayer;
    payerLayer.frame = attachView.bounds;
    
    [attachView.layer addSublayer:payerLayer];
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    NSLog(@"");
}
- (void)_stopPlay {
    
        _videoItem = nil;
        _avPlayer = nil;
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

        [_playerLayer removeFromSuperlayer];
}
- (void)_handlePlayEnd{
        // 重新播放
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}
- (void)_taptoPlay {
    
    //    [avplayer play];
    
    NSLog(@"_taptoPlay");
    
}
#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }else if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"缓存 %@",[change objectForKey:NSKeyValueChangeNewKey]);
        
    }
}
@end
