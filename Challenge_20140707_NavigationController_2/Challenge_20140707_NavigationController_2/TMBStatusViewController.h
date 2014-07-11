//
//  TMBStatusViewController.h
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/9/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBEditViewController.h"
#import "TMBSharedData.h"

@interface TMBStatusViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


-(void)loadLabelsData;
-(void)setupStatusColors;
-(IBAction)editData:(id)sender;





@end
