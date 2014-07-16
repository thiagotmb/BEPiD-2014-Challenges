//
//  TMBRootViewController.h
//  Challenge_20140715_TableView_Aula_2
//
//  Created by Thiago Bernardes on 7/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *numbers;

@property (nonatomic,strong) UIRefreshControl *addNewTableControl;

@end
