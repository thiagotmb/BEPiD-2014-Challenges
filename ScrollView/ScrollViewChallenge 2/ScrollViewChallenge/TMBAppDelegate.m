//
//  TMBAppDelegate.m
//  ScrollViewChallenge
//
//  Created by Thiago on 5/21/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBAppDelegate.h"


@implementation TMBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Aumentando o tamanho da janela em duas vezes
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *=2.0;
    bigRect.size.height *=2.0;
    
    
    //adicionando o uiscrollview na tela
    TMBScrollView *scrollView = [[TMBScrollView alloc] initWithFrame:screenRect];
    [self.window addSubview:scrollView];
    
  /* desafio 1
    //chamando a classe principal e adicionando a variavel de scrollview no frame
    TMBScrollView *viewPrincipal = [[TMBScrollView alloc]initWithFrame:screenRect];
    
    
    //adicionando subview a scrollview
    [scrollView addSubview:viewPrincipal];
    
    //informando o tamanho da scrollView
    scrollView.contentSize = bigRect.size;
    
 
    UILabel *topo = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 20)];
    topo.text = @"Topo";
    [scrollView addSubview:topo];
    
    UILabel *rodape = [[UILabel alloc] initWithFrame:CGRectMake(0,bigRect.size.height - 20, 100, 20)];
    rodape.text = @"Rodape";
    [scrollView addSubview:rodape];
    */
    
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
