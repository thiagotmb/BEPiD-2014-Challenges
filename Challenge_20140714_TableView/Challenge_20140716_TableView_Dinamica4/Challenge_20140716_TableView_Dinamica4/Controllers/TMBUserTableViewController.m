//
//  TMBUserTableViewController.m
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBUserTableViewController.h"

@interface TMBUserTableViewController ()

@end

@implementation TMBUserTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _userManager = [[TMBUsersDAO alloc] init];
    _usersArray = [_userManager getUsers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.usersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.currentUser = [self.usersArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
    cell.userId.text = [NSString stringWithFormat:@"%d",self.currentUser.userId];
    cell.userName.text = self.currentUser.userName;
    cell.userAge.text = [NSString stringWithFormat:@"%d",self.currentUser.userAge];
    cell.userEmail.text = self.currentUser.userEmail;
    cell.userPhoto.image = self.currentUser.userPhoto;
    cell.userSalary.text = [NSString stringWithFormat:@"R$:%.2f",self.currentUser.userSalary];
    cell.salaryMonth.text = [NSString stringWithFormat:@"%d/",self.currentUser.salaryMonth];
    cell.salaryYear.text = [NSString stringWithFormat:@"%d",self.currentUser.salaryYear];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    self.currentUser = [self.usersArray objectAtIndex:indexPath.row];
    
    TMBUserDetailViewController *destineViewController = segue.destinationViewController;
    destineViewController.userSalaryText = [NSString stringWithFormat:@"R$:%.2f",self.currentUser.userSalary];
    destineViewController.userPhotoImage = self.currentUser.userPhoto;
    
}


@end
