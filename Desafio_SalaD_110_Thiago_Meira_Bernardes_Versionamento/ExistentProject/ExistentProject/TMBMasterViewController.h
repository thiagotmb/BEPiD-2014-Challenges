//
//  TMBMasterViewController.h
//  ExistentProject
//
//  Created by Thiago Bernardes on 7/29/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMBDetailViewController;

#import <CoreData/CoreData.h>

@interface TMBMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) TMBDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
