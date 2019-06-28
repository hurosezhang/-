//
//  AppDelegate.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/5/29.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
//  GTNewsViewController   * viewController = [[GTNewsViewController alloc] init];
  
    GTNewsViewController *viewController1 = [[GTNewsViewController alloc] init];
    viewController1.tabBarItem.title = @"新闻";
    viewController1.view.backgroundColor= [UIColor purpleColor];
    viewController1.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    viewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    GTVideoViewController *viewController2 = [[GTVideoViewController alloc] init];
 
    
    GTRecommendViewController *viewController3 = [[GTRecommendViewController alloc] init];
  
    
    UIViewController *mineController = [[UIViewController alloc] init];
    mineController.tabBarItem.title = @"我的";
    mineController.view.backgroundColor= [UIColor lightGrayColor];
    mineController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    mineController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    tabBarController.viewControllers = @[viewController1,viewController2,viewController3,mineController];
      UINavigationController * NavigationController =[[UINavigationController alloc] initWithRootViewController:tabBarController ];
    tabBarController.delegate = self;
    self.window.rootViewController = NavigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"点击一tabbar");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
