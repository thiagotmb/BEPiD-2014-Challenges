//
//  TMBUserTableViewController.h
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBUsersList.h"
#import "TMBUsersDAO.h"
#import "TMBUserTableViewCell.h"
#import "TMBUserDetailViewController.h"

@interface TMBUserTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *usersArray;
@property (nonatomic,strong) TMBUsersList* currentUser;
@property (nonatomic,strong) TMBUsersDAO* userManager;

@end
