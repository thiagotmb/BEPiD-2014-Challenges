//
//  TMBStatusViewController.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/9/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBStatusViewController.h"


@interface TMBStatusViewController ()

@end

@implementation TMBStatusViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        UINavigationItem *mainNavItem = self.navigationItem;
        
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc ] initWithTitle:@"Atualizar" style:UIBarButtonItemStylePlain target:self action:@selector(editData:)];
        
        mainNavItem.rightBarButtonItem = editButton;
        
        mainNavItem.title = @"Carro";
 
        
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadLabelsData];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self loadLabelsData];

}


-(IBAction)editData:(id)sender{
    
    TMBEditViewController *editData = [[TMBEditViewController alloc] initWithNibName:@"TMBEditViewController" bundle:nil];
    
    [self.navigationController pushViewController:editData animated:YES];
    
}



-(void)loadLabelsData{
    
    _nameLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeName];
    
    _modelLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeModel];
    
    _statusLabel.text =[[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
    
    [self setupStatusColors];
}

-(void)setupStatusColors{
    
    
    NSDate *dateA ;
    NSDate *dateB = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
    
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];
    
    
    if ([_statusLabel.text isEqual:@"Disponível"]) {
        
        _statusLabel.textColor = [UIColor greenColor];
        if(components.day >= 30)
            _statusLabel.backgroundColor = [UIColor blueColor];
        
    }else if([_statusLabel.text isEqual:@"Oficina"]){
        
        _statusLabel.textColor = [UIColor orangeColor];
        _statusLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        
    }else if([_statusLabel.text isEqual:@"Alugado"]){
        
        _statusLabel.textColor = [UIColor redColor];
        if(components.day > 0){
            
            _statusLabel.backgroundColor = [UIColor redColor];
            _statusLabel.textColor = [UIColor whiteColor];
            
        }
        
        
    }else{
        
        _statusLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    }
    
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
