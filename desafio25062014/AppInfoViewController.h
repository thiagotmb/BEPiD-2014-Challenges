//
//  AppInfoViewController.h
//  desafio25062014
//
//  Created by Thiago Bernardes on 6/25/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInfoViewController : UIViewController

@property (nonatomic) UIButton* notification;
@property (nonatomic) NSInteger numberOfNotifications;

-(void)addNotificationInApp;


@end
