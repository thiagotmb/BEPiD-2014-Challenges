//
//  TMBAppDelegate.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBAppDelegate.h"
#import "TMBDetailViewController.h"
#import "TMBTableViewController.h"
#import "TMBItemStore.h"

@implementation TMBAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    TMBDetailViewController *detailViewController = [[TMBDetailViewController alloc] init];
    TMBTableViewController *tableViewController = [[TMBTableViewController alloc] init];
    
    tableViewController.detailViewController = detailViewController;
    
    UINavigationController* masterNavigation = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        UINavigationController *detailNavigation = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        
        UISplitViewController* splitViewController = [[UISplitViewController alloc] init];
        
        splitViewController.viewControllers = @[masterNavigation,detailNavigation];
        splitViewController.delegate = detailViewController;
        
        self.window.rootViewController = splitViewController;

    }else{
        
        self.window.rootViewController = masterNavigation;
    }
    
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
    
    BOOL sucess = [[TMBItemStore sharedStore] saveChanges];
    
    if (sucess) {
        NSLog(@"Saved all of the TMBItems");
        
    }else{
        NSLog(@"Could not save any of the TMBItems");
        
    }
    
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
    // Saves changes in the application's managed object context before the application terminates.
}




@end
