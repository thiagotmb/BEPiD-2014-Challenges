//
//  AppDelegate.h
//  Challenge_20140715_TableView_Aula_2
//
//  Created by Thiago Bernardes on 7/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) NSMutableArray *numbers;

-(NSString*)itemArchivePath;

@end
