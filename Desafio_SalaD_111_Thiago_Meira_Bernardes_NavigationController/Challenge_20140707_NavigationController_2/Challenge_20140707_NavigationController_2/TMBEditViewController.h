//
//  TMBEditViewController.h
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/9/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSharedData.h"
#import "TMBReserveViewController.h"
@interface TMBEditViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *plaqueLabel;
@property (weak, nonatomic) IBOutlet UILabel *coustLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateUntilNowLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateUntilNowTitle;
@property (weak, nonatomic) IBOutlet UILabel *startDateTitle;
@property (weak, nonatomic) IBOutlet UILabel *endDateTitle;



@property (weak, nonatomic) IBOutlet UIButton *returnButton;
@property (weak, nonatomic) IBOutlet UIButton *manufactoryButton;


-(void)loadlOutletData;
-(void)setupStatusColor;
-(void)editDone;
-(void)setupReturnButton;

- (IBAction)returnAction:(id)sender;
- (IBAction)manufactoryAction:(id)sender;

@end
