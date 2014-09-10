//
//  TMBUsersList.h
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBUsersList : NSObject

@property (nonatomic) int userId;
@property (nonatomic) NSString* userName;
@property (nonatomic) int userAge;
@property (nonatomic) NSString* userEmail;
@property (nonatomic) UIImage* userPhoto;
@property (nonatomic) float userSalary;
@property (nonatomic) int salaryMonth;
@property (nonatomic) int salaryYear;

@end
