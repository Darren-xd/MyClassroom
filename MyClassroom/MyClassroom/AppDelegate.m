//
//  AppDelegate.m
//  MyClassroom
//
//  Created by Darren on 12/7/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ChatViewController.h"
#import "SelfViewController.h"
#import "FindViewController.h"
#import "FriendsViewController.h"

@interface AppDelegate ()

@property(nonatomic,copy)NSMutableArray *array;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
//    userInfo
    UITabBarController *mainWindow = [[UITabBarController alloc]init];
    self.window.rootViewController = mainWindow;
    
    ChatViewController *chat = [[ChatViewController alloc]init];
    FriendsViewController *friends = [[FriendsViewController alloc]init];
    FindViewController *find = [[FindViewController alloc]init];
    SelfViewController *me = [[SelfViewController alloc] init];
    
    UINavigationController *chatNavigation = [[UINavigationController alloc]initWithRootViewController:chat];
    chatNavigation.title = @"微信";
    UINavigationController *friendsNavigation = [[UINavigationController alloc]initWithRootViewController:friends];
    friendsNavigation.title = @"通讯录";
    UINavigationController *findNavigation = [[UINavigationController alloc]initWithRootViewController:find];
    findNavigation.title = @"发现";
    UINavigationController *meNavigation = [[UINavigationController alloc]initWithRootViewController:me];
    meNavigation.title = @"我";
    
//    [mainWindow addChildViewController:chatNavigation];
//    [mainWindow addChildViewController:friendsNavigation];
//    [mainWindow addChildViewController:findNavigation];
//    [mainWindow addChildViewController:meNavigation];o
    
    mainWindow.viewControllers = @[chatNavigation,friendsNavigation,findNavigation,meNavigation];
    
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
