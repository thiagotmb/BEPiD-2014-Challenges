//
//  TMBTableTableViewController.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBTableViewController.h"
#import "TMBDetailViewController.h"
#import "TMBItemStore.h"
#import "TMBItem.h"

#define NumberOfItems 3

@interface TMBTableViewController ()<UISplitViewControllerDelegate>
@property (nonatomic) TMBItemStore *itemStore;

@end

@implementation TMBTableViewController

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
    
    self.itemStore = [TMBItemStore sharedStore];
    for (int i = 0; i<NumberOfItems; i++) {
        [self.itemStore createItem];

    }
        
    
    UIBarButtonItem *addNewItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem)];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTheItems)];
    
    NSArray* barButtomItens = @[addNewItem,editItem];
    
    self.navigationItem.rightBarButtonItems = barButtomItens;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItem:) name:@"ItemChanged" object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)addNewItem{
    
    [self.itemStore createItem];
    [self.tableView reloadData];
}

-(void)editTheItems{
    
    if (self.tableView.editing) {
        [self.tableView setEditing:NO];
    }else
    {
        [self.tableView setEditing:YES];
    }
}

-(void)updateItem:(NSNotificationCenter*)aNotification{
    
    
    NSIndexPath *currentIndex = [self.tableView indexPathForSelectedRow] ;
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:currentIndex animated:YES scrollPosition:UITableViewScrollPositionNone];

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
    return self.itemStore.allItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    TMBItem *item = self.itemStore.allItems[indexPath.row];
    
    cell.textLabel.text = item.itemName;
    
    // Configure the cell...
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // self.detailViewController = [[TMBDetailViewController alloc] initWithNibName:@"TMBDetailViewController" bundle:nil];
    
    TMBItem *item = self.itemStore.allItems[indexPath.row];
    
    
    self.detailViewController.item = item;
    
    if (!self.splitViewController) {
        
        [self.navigationController pushViewController:self.detailViewController animated:YES];

    }else{
        [self.detailViewController viewWillAppear:YES];
    }
    
    
}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
     // Return NO if you do not want the specified item to be editable.
     return YES;
 }



 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         // Delete the row from the data source
         
         [self.itemStore removeItemAtIndex:indexPath.row];
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         
     } else if (editingStyle == UITableViewCellEditingStyleInsert) {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
 }



 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     
     [self.itemStore moveItemFrom:fromIndexPath.row to:toIndexPath.row];
    
     
 }



 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
     // Return NO if you do not want the item to be re-orderable.
     return YES;
 }


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
