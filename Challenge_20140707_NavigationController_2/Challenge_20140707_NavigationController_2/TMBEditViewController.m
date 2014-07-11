//
//  TMBEditViewController.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/9/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBEditViewController.h"

@interface TMBEditViewController ()

@end

@implementation TMBEditViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UINavigationItem *mainNavItem = self.navigationItem;
        
        UIBarButtonItem *editDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(editDone)];
        
        mainNavItem.rightBarButtonItem = editDoneButton;
        
        mainNavItem.title = @"Detalhes";
        
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
        
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self loadlOutletData];

}


-(void)loadlOutletData{
    
    _nameLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeName];
    
    _modelLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeModel];
    
    _plaqueLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypePlaque];
    
    _coustLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeCoust];
    
    _stateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
    
    _startDateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeStartDate];
    
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString * dateToSet = [formatter stringFromDate:[[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate]];
    _endDateLabel.text = dateToSet;
    
    
    
    NSDate *dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
    NSDate *dateB = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];
    
    _dateUntilNowLabel.text = [NSString stringWithFormat:@"%d dias",components.day];
    
    if([_stateLabel.text isEqual:@"Alugado"])
        _dateUntilNowTitle.text = @"Alugado há";
    else if([_stateLabel.text isEqual:@"Disponível"])
            _dateUntilNowTitle.text = @"Disponível há";
        else if ([_stateLabel.text isEqual:@"Oficina"])
                _dateUntilNowTitle.text = @"Na Oficina há";


    
    [self setupStatusColors];
    [self setupReturnButton];
    
    
}

-(void)setupStatusColors{
    
    if ([_stateLabel.text isEqual:@"Disponível"]) {
        
        _stateLabel.textColor = [UIColor greenColor];
        NSDate *dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
        NSDate *dateB = [NSDate date];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                                   fromDate:dateA
                                                     toDate:dateB
                                                    options:0];
        
        if(components.day >= 30)
            _stateLabel.backgroundColor = [UIColor blueColor];
        
    }else if([_stateLabel.text isEqual:@"Oficina"]){
        
        _stateLabel.textColor = [UIColor orangeColor];
        _stateLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        
    }else if([_stateLabel.text isEqual:@"Alugado"]){
        
        _stateLabel.textColor = [UIColor redColor];
        
        NSDate *dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
        NSDate *dateB = [NSDate date];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                                   fromDate:dateA
                                                     toDate:dateB
                                                    options:0];
        
        if(components.day > 0){
            
            _stateLabel.backgroundColor = [UIColor redColor];
            _stateLabel.textColor = [UIColor whiteColor];
            
        }
    }else{
        
        _stateLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    }
    
    NSLog(@"passei");
    
}


-(void)editDone{
    
    [[TMBSharedData sharedData] updateDatabase];
    [self.navigationController popViewControllerAnimated:YES];

    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[TMBSharedData sharedData] setUpDatabase];

}

-(void)setupReturnButton{
    
    if ([_stateLabel.text isEqual:@"Disponível"]) {
        _stateLabel.textColor = [UIColor greenColor];
        [_returnButton setTitle:@"Alugar" forState:UIControlStateNormal];
    }else if([_stateLabel.text isEqual:@"Oficina"]){
        [_returnButton setTitle:@"Retorno" forState:UIControlStateNormal];
        _stateLabel.textColor = [UIColor orangeColor];
    }else if([_stateLabel.text isEqual:@"Alugado"]){
        [_returnButton setTitle:@"Retorno" forState:UIControlStateNormal];
        _stateLabel.textColor = [UIColor redColor];
    }
    
    
}

- (IBAction)returnAction:(id)sender {
    
    
    if([_returnButton.titleLabel.text isEqual:@"Retorno"]){
        
        [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:@"Disponível"];
        _stateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
        [[TMBSharedData sharedData] setSharedData:TMBDataTypeEndDate withData:[NSDate date]];

        [self setupReturnButton];
        [self setupStatusColors];
        
    }else{
        TMBReserveViewController *reserveView = [[TMBReserveViewController alloc] initWithNibName:@"TMBReserveViewController" bundle:nil];
        reserveView.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.2];
        [self.navigationController pushViewController:reserveView animated:YES];

    }
}

- (IBAction)manufactoryAction:(id)sender {
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:@"Oficina"];
    _stateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
    [self setupStatusColors];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
