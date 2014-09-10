//
//  TMBContactsTableViewController.h
//  Challenge_20140716_TableView_Dinamica2
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBContactTableViewCell.h"

@interface TMBContactsTableViewController : UITableViewController

@property (nonatomic,strong) NSArray* allContacts;

@property (nonatomic,strong) NSDictionary* currentContact;

@end
