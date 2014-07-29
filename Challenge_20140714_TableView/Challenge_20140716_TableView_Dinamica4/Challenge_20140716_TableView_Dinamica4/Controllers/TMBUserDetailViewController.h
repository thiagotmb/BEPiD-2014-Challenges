//
//  TMBUserDetailViewController.h
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBUserDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (nonatomic, strong) UIImage* userPhotoImage;

@property (weak, nonatomic) IBOutlet UILabel *userSalary;
@property (nonatomic,strong) NSString* userSalaryText;

@end
