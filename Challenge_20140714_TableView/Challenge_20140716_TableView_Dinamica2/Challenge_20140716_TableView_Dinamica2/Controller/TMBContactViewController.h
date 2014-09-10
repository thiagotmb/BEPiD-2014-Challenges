//
//  TMBContactViewController.h
//  Challenge_20140716_TableView_Dinamica2
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBContactViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *contactPhoto;
@property (nonatomic, strong) NSString* imageName;


@property (weak, nonatomic) IBOutlet UILabel *contactFirstName;
@property (nonatomic, strong) NSString* firstName;


@property (weak, nonatomic) IBOutlet UILabel *contactLastName;
@property (nonatomic, strong) NSString* lastName;

@end
