//
//  TMBDetailViewController.h
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMBItem;
@interface TMBDetailViewController : UIViewController <UITextFieldDelegate, UISplitViewControllerDelegate>

@property (nonatomic) TMBItem *item;

@end
