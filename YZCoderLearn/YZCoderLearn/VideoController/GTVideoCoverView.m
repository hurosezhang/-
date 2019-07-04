//
//  GTVideoCoverView.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/3.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>
@interface GTVideoCoverView ()
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *videoItem;

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UIImageView *playButton;
@property (nonatomic, strong) NSString *videoUrl;
@end
@implementation GTVideoCoverView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake( (frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50  , 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
            
            _playButton;
        })];
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_taptoPlay)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        
    }
    return self;
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - public
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image  = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    _videoUrl = videoUrl ;
}
#pragma mark - privite
- (void)_handlePlayEnd{
    
    _videoItem = nil;
    _avPlayer = nil;
    [_playerLayer removeFromSuperlayer];
}
- (void)_taptoPlay {
    
    _videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    NSURL * videoUrl = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    AVPlayerItem * videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    [videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    AVPlayer *avplayer  = [AVPlayer playerWithPlayerItem:videoItem];
    
    AVPlayerLayer * payerLayer = [AVPlayerLayer playerLayerWithPlayer:avplayer];
    _videoItem = videoItem;
    _avPlayer = avplayer;
    _playerLayer = payerLayer;
    payerLayer.frame = _coverView.bounds;

    [_coverView.layer addSublayer:payerLayer];
    
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
    }
}
@end
