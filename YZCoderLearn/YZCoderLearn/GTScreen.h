//
//  GTScreen.h
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/26.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define IS_LANDSCAPE  (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH  (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE_X_XR_XMAX ( IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)
#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
#define STATUSBARHEIGHT (IS_IPHONE_X_XR_XMAX ? 44 : 20)

#define UI(x) UIAdapter(x)
#define UIRect(x, y, width, height)  UIRectAdapter(x, y, width, height)

static inline NSInteger UIAdapter(float x)
{
    //1,分机型

    //2,屏幕宽度按比例适配

    CGFloat scale = 414 / SCREEN_WIDTH;

    return (NSInteger)x  / scale;
}

static inline CGRect UIRectAdapter(x, y, width, height)
{
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface GTScreen : UIView
+ (CGSize)sizeFor65Inch ;
+(CGSize)sizeFor61Inch ;
+(CGSize)sizeFor58Inch ;

@end

NS_ASSUME_NONNULL_END
