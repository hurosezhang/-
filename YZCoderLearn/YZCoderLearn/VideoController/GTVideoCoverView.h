//
//  GTVideoCoverView.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/3.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
