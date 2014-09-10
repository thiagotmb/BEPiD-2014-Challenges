//
//  TMBViewController.m
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBViewController.h"

@interface TMBViewController ()

@end

@implementation TMBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UINavigationItem *mainNavItem = self.navigationItem;
        
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(editName:)];
        
        mainNavItem.rightBarButtonItem = editButton;
        
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    self.nameLabel.text = [[TMBData sharedData] getSharedName];
    self.ageLabel.text = [NSString stringWithFormat:@"%d",[[TMBData sharedData] getSharedAge]];
    self.heightLabel.text = [NSString stringWithFormat:@"%.2f",[[TMBData sharedData] getSharedHeight]];
    self.weightLabel.text = [NSString stringWithFormat:@"%.2f",[[TMBData sharedData] getSharedWeight]];
}

-(IBAction)editName:(id)sender{
    
    TMBViewControllerEditable *ediViewController  = [[TMBViewControllerEditable alloc]initWithNibName:@"TMBViewControllerEditable" bundle:nil];
    
    [self.navigationController pushViewController:ediViewController animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
