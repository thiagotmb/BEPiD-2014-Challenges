//
//  TMBRootViewController.m
//  Challenge_20140715_TableView_Aula_2
//
//  Created by Thiago Bernardes on 7/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBRootViewController.h"

@interface TMBRootViewController ()

@end

@implementation TMBRootViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self){
        AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        delegate.numbers = [aDecoder decodeObjectForKey:@"numbers"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [coder encodeObject:delegate.numbers forKey:@"numbers"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Table View";
    NSLog(@"ok" );
    
    _addNewTableControl = [[UIRefreshControl alloc] init];
    [_addNewTableControl addTarget:self action:@selector(alertNewObject) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_addNewTableControl];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(alertNewObject)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.numbers = [NSKeyedUnarchiver unarchiveObjectWithFile:[delegate itemArchivePath] ];
    if(!delegate.numbers){
        self.numbers = [[NSMutableArray alloc] init];
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.numbers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.numbers objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",indexPath.row+1]];
    
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        [self.numbers removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

-(void)alertNewObject{
    
    UIAlertView* addNewObjectAlert = [[UIAlertView alloc ] initWithTitle:@"Digite um número" message:@"" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
    
    addNewObjectAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [_addNewTableControl endRefreshing];
    [addNewObjectAlert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 1){
        
        NSString *text = [alertView textFieldAtIndex:0].text;
        
        if(!self.numbers){
            
            self.numbers = [[NSMutableArray alloc] init];
        }
        
        [self.numbers insertObject:text atIndex:self.numbers.count];

        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.numbers.count-1 inSection:0];
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}

@end
