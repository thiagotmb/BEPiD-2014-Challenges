//
//  TMBContactsTableViewController.m
//  Challenge_20140716_TableView_Dinamica2
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBContactsTableViewController.h"

@interface TMBContactsTableViewController ()

@end

@implementation TMBContactsTableViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    self.allContacts = [NSArray arrayWithContentsOfFile:path];
    
    
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
    return self.allContacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    self.currentContact = [self.allContacts objectAtIndex:indexPath.row];
    
    
    UIImage *contactPhoto = [UIImage imageNamed:self.currentContact[@"imageName"]];
    
    cell.contactFirstName.text = self.currentContact[@"firstName"];
    cell.contactLastName.text = self.currentContact[@"lastName"];
    cell.contactPhoto.image = contactPhoto;
    
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"showContactDetails"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.currentContact = [self.allContacts objectAtIndex:indexPath.row];
        
        TMBContactViewController *destineViewController = segue.destinationViewController;
        destineViewController.firstName = self.currentContact[@"firstName"];
        destineViewController.lastName = self.currentContact[@"lastName"];
        destineViewController.imageName = self.currentContact[@"imageName"];
        
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
