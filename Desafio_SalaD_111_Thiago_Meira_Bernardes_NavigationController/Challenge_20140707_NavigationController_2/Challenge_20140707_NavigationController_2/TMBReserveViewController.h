//
//  TMBReserveViewController.h
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSharedData.h"

@interface TMBReserveViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;

-(void)loadOutletData;
- (IBAction)reserveCar:(id)sender;

@end
