//
//  TMBPageViewController.h
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBNavigationController.h"


@interface TMBPageViewController : UIViewController<UIPageViewControllerDataSource>

@property (nonatomic) NSUInteger index;

@property (nonatomic,strong) UIPageViewController* pageController;


-(void)setUpPageController;


@end
