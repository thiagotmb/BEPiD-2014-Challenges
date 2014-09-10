//
//  TMBViewController.h
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBData.h"
#import "TMBViewControllerEditable.h"

@interface TMBViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;


@end
