//
//  GTNotification.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/14.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>
@interface GTNotification ()<UNUserNotificationCenterDelegate>

@end
@implementation GTNotification

+ (GTNotification *)notificationManager {
    static GTNotification * manager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc] init];
    });
    
    return manager;
}
- (void )checknotificationAuthorization  {
    UNUserNotificationCenter * center =     [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
   [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"");
       if (granted) {
           [self _pushLocalNotification];
       }
    }];
    
}
- (void)_pushLocalNotification {
    UNMutableNotificationContent * content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"极客时间";
    content.body = @"ios 从入门到掀桌(╯‵□′)╯︵┻━┻";
    UNTimeIntervalNotificationTrigger * trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:20.f repeats:NO];
    
    UNNotificationRequest * request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        NSLog(@"");
    }];
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert);
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    
    completionHandler();
    
}
@end
