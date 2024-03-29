//
//  AppDelegate.m
//  RYFTopBarDemo
//
//  Created by renyufei on 15/7/5.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    FirstViewController *firstController   = [[FirstViewController alloc] init];
    firstController.title                  = @"First";
    SecondViewController *secondController = [[SecondViewController alloc] init];
    secondController.title                 = @"Second";
    ThirdViewController *thirdController   = [[ThirdViewController alloc] init];
    thirdController.title                  = @"Third";
    FourthViewController *fourthController = [[FourthViewController alloc] init];
    fourthController.title                 = @"Fourth";
    FifthViewController *fifthController   = [[FifthViewController alloc] init];
    fifthController.title                  = @"Fifth";
    SixViewController *sixController       = [[SixViewController alloc] init];
    sixController.title                    = @"Six";
    SevenViewController *sevenController   = [[SevenViewController alloc] init];
    sevenController.title                  = @"第7标题...";

    ViewController *viewController = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    viewController.viewControllers          = @[firstController, secondController, thirdController, fourthController, fifthController, sixController, sevenController];
    
    self.window.rootViewController = nav;
    self.window.backgroundColor    = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
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
