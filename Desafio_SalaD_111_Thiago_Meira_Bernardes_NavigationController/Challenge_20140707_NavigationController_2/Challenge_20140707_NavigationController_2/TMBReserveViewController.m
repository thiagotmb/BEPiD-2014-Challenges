//
//  TMBReserveViewController.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBReserveViewController.h"

@interface TMBReserveViewController ()

@end

@implementation TMBReserveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *mainNavItem = self.navigationItem;
        mainNavItem.title = @"Reserva";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _endDatePicker.minimumDate = [NSDate date];
    _endDatePicker.datePickerMode = UIDatePickerModeDate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(disableScroll)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view from its nib.
}

-(void)disableScroll{
    
    //empty
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadOutletData{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:[NSDate date]];

    _startDateLabel.text = dateString;
    // Convert string to date object
    _endDatePicker.date = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self loadOutletData];
}



- (IBAction)reserveCar:(id)sender {
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:@"Alugado"];
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeStartDate withData:_startDateLabel.text];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeEndDate withData:_endDatePicker.date];
        
    [self.navigationController popViewControllerAnimated:YES];
}

@end
