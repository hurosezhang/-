//
//  GTDetailViewController.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/26.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>
- (instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
