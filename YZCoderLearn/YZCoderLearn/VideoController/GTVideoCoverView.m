//
//  GTVideoCoverView.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/3.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"
@interface GTVideoCoverView ()

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
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake( (frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];

            _playButton;
        })];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_taptoPlay)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (void)dealloc {
}

#pragma mark - public
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    _videoUrl = videoUrl;
}

#pragma mark - privite
- (void)_taptoPlay {
    NSURL *videoUrl = [NSURL URLWithString:_videoUrl];
    [[GTVideoPlayer player] playVideoWithUrl:videoUrl attachView:_coverView];
}

@end
