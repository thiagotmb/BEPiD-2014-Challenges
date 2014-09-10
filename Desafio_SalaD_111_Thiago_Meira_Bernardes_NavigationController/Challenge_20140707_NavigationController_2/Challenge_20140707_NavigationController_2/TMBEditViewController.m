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
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(disableScroll)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view from its nib.
}

-(void)disableScroll{
    
    //empty
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
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:[[TMBSharedData sharedData]getSharedData:TMBDataTypeEndDate]];
    _endDateLabel.text = dateString;

    
    
    NSDate *dateA ;
    
    if([_stateLabel.text isEqual:@"Alugado"]){
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSDate * dateToSet = [formatter dateFromString:[[TMBSharedData sharedData] getSharedData:TMBDataTypeStartDate]];
        
        dateA = dateToSet;
        _dateUntilNowTitle.text = @"Alugado há";
        
        _endDateLabel.hidden = NO;
        _startDateLabel.hidden = NO;
        _startDateTitle.hidden=NO;
        _endDateTitle.hidden = NO;
        
    }else if([_stateLabel.text isEqual:@"Disponível"]){
        
            dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
            _dateUntilNowTitle.text = @"Disponível há";
        
        _endDateLabel.hidden = YES;
        _startDateLabel.hidden = YES;
        _startDateTitle.hidden=YES;
        _endDateTitle.hidden = YES;

    }else if ([_stateLabel.text isEqual:@"Oficina"]){
        
            dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
            _dateUntilNowTitle.text = @"Na Oficina há";
        
        _endDateLabel.hidden = YES;
        _startDateLabel.hidden = YES;
        _startDateTitle.hidden=YES;
        _endDateTitle.hidden = YES;
    }

    
    NSDate *dateB = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];
    
    _dateUntilNowLabel.text = [NSString stringWithFormat:@"%d dias",components.day];
    
    [self setupStatusColor];
    [self setupReturnButton];
    
    
}

-(void)setupStatusColor{
    
    NSDate *dateA ;
    NSDate *dateB = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    dateA = [[TMBSharedData sharedData] getSharedData:TMBDataTypeEndDate];
    
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];

    
    if ([_stateLabel.text isEqual:@"Disponível"]) {
        
        _stateLabel.textColor = [UIColor greenColor];
        if(components.day >= 30)
            _stateLabel.backgroundColor = [UIColor blueColor];
        
    }else if([_stateLabel.text isEqual:@"Oficina"]){
        
        _stateLabel.textColor = [UIColor orangeColor];
        _stateLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        
    }else if([_stateLabel.text isEqual:@"Alugado"]){
        
        _stateLabel.textColor = [UIColor redColor];
        if(components.day > 0){
            
            _stateLabel.textColor = [UIColor whiteColor];
            _stateLabel.backgroundColor = [UIColor redColor];
            
        }
        
        
    }else{
        
        _stateLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    }
    
    
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
        [_returnButton setTitle:@"Alugar" forState:UIControlStateNormal];
        _manufactoryButton.hidden = NO;
    }else if([_stateLabel.text isEqual:@"Oficina"]){
        [_returnButton setTitle:@"Retorno" forState:UIControlStateNormal];
        _manufactoryButton.hidden = YES;
    }else if([_stateLabel.text isEqual:@"Alugado"]){
        _manufactoryButton.hidden = NO;
        [_returnButton setTitle:@"Retorno" forState:UIControlStateNormal];
    }
    
    
}

- (IBAction)returnAction:(id)sender {
    
    
    if([_returnButton.titleLabel.text isEqual:@"Retorno"]){
        
        [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:@"Disponível"];
        _stateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
        [[TMBSharedData sharedData] setSharedData:TMBDataTypeEndDate withData:[NSDate date]];

        [self setupReturnButton];
        [self setupStatusColor];
        
    }else{
        TMBReserveViewController *reserveView = [[TMBReserveViewController alloc] initWithNibName:@"TMBReserveViewController" bundle:nil];
        reserveView.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.2];
        [self.navigationController pushViewController:reserveView animated:YES];

    }
}

- (IBAction)manufactoryAction:(id)sender {
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:@"Oficina"];
    _stateLabel.text = [[TMBSharedData sharedData] getSharedData:TMBDataTypeState];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeEndDate withData:[NSDate date]];
    [self setupReturnButton];
    [self setupStatusColor];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
