//
//  TMBUserTableViewCell.h
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBUserTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (weak, nonatomic) IBOutlet UILabel *userId;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userAge;
@property (weak, nonatomic) IBOutlet UILabel *userEmail;
@property (weak, nonatomic) IBOutlet UILabel *userSalary;
@property (weak, nonatomic) IBOutlet UILabel *salaryMonth;
@property (weak, nonatomic) IBOutlet UILabel *salaryYear;

@end
