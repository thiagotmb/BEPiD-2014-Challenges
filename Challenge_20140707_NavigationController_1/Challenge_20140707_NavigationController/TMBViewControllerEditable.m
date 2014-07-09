//
//  TMBViewControllerEditable.m
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBViewControllerEditable.h"

@interface TMBViewControllerEditable ()

@end

@implementation TMBViewControllerEditable

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *mainNavItem = self.navigationItem;
        
        UIBarButtonItem *editDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(editDone:)];
        
        mainNavItem.rightBarButtonItem = editDoneButton;
        
        
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    self.nameTextField.text = [[TMBData sharedData] getSharedName];
    
    self.ageTextField.text = [NSString stringWithFormat:@"%d",[[TMBData sharedData] getSharedAge]];
    
    self.heightTextField.text = [NSString stringWithFormat:@"%.2f",[[TMBData sharedData] getSharedHeight]];
    
    self.weightTextField.text = [NSString stringWithFormat:@"%.2f",[[TMBData sharedData] getSharedWeight]];
}
-(IBAction)editDone:(id)sender{
    
    [[TMBData sharedData] setSharedName:self.nameTextField.text];
    [[TMBData sharedData] setSharedAge:[self.ageTextField.text intValue]];
    [[TMBData sharedData] setSharedHeight:[self.heightTextField.text floatValue]];
    [[TMBData sharedData] setSharedWeight:[self.weightTextField.text floatValue]];
    
    [self.navigationController popViewControllerAnimated:YES];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
