//
//  AppDelegate.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/7.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "AppDelegate.h"
#import "CHRCateViewController.h"
#import "MineViewController.h"
#import "OfflineDownLoadViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



-(void)initRootVc
{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    CHRCateViewController *vc1 = [[CHRCateViewController alloc]init];
    vc1.view.frame = CGRectMake(0, 0,ScreenW , ScreenH);
    UINavigationController *nvc1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    vc1.navigationController.navigationBar.hidden = YES;
    
    MineViewController *vc2 = [[MineViewController alloc]init];
    UINavigationController *nvc2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    vc2.title = @"我的传课";
    
    OfflineDownLoadViewController *vc3 = [[OfflineDownLoadViewController alloc]init];
    UINavigationController *nvc3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    vc3.title = @"离线下载";
    
    NSArray *viewCtrs = @[nvc1,nvc2,nvc3];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    [tabBarController setViewControllers:viewCtrs animated:YES];
    
    self.window.rootViewController = tabBarController;
    
    UITabBar *tabbar = tabBarController.tabBar;
    
    UITabBarItem *item0 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:2];
    
    item0.selectedImage = [[UIImage imageNamed:@"bottom_tab1_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"bottom_tab1_unpre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[UIImage imageNamed:@"bottom_tab2_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"bottom_tab2_unpre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"bottom_tab3_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"bottom_tab3_unpre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置字体颜色
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = UICOLOR(67, 199, 176, 1);
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [[UITabBarItem appearance]setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    [self.window makeKeyAndVisible];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    [self initRootVc];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
