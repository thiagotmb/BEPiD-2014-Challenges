//
//  TMBAppDelegate.m
//  Desafio1
//
//  Created by Thiago on 5/19/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBAppDelegate.h"
#import "TMBViewController.h"

@implementation TMBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    CGRect orange = CGRectMake(0, 0, self.window.bounds.size.width/2, self.window.bounds.size.height/3);
    TMBView *orangeView = [[TMBView alloc] initWithFrame:orange];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:orangeView];
    
    CGRect green = CGRectMake(10, 15, orangeView.frame.size.width -20, orangeView.frame.size.height/2);
    TMBView *greenView = [[TMBView alloc] initWithFrame:green];
    greenView.backgroundColor = [UIColor greenColor];
    [orangeView addSubview:greenView];
    
    CGRect gray = CGRectMake(self.window.bounds.size.width-50, self.window.bounds.size.height-50, 50, 50);
    TMBView *grayView = [[TMBView alloc] initWithFrame:gray];
    grayView.backgroundColor = [UIColor grayColor];
    [orangeView addSubview:grayView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
