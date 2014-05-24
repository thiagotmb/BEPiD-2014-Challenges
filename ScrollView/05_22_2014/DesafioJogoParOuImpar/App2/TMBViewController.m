//
//  TMBViewController.m
//  App2
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
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
        
        [self.view addSubview:_mainScrollView];
        [self.mainScrollView setContentSize: CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height)];
        
        [self.firstView setFrame:CGRectMake(0, 0, self.firstView.frame.size.width, self.firstView.frame.size.height)];
        
        [self.mainScrollView addSubview:_firstView];

        
        
    }
    return self;
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

- (IBAction)play:(id)sender {
    
    
    //set position and size of views
    [self.mainScrollView setContentSize: CGSizeMake(self.mainScrollView.frame.size.width*2, self.mainScrollView.frame.size.height)];
    [self.firstView setFrame:CGRectMake(0, 0, self.firstView.frame.size.width, self.firstView.frame.size.height)];
    [self.secondView setFrame:CGRectMake(self.secondView.frame.size.width, 0, self.secondView.frame.size.width, self.secondView.frame.size.height)];
    
    [self gameRun];
    
    [self.mainScrollView setPagingEnabled:YES];
    
    [self.mainScrollView addSubview:_firstView];
    [self.mainScrollView addSubview:_secondView];
    
    [self.mainScrollView setContentOffset:CGPointMake(self.secondView.frame.origin.x, self.secondView.frame.origin.y) animated:YES];
    
    
}



//Game impasse run, generate random number of app bet, and condition to result of game;
- (void)gameRun
{
    _appNumber = (arc4random() % (5-0+1) + 0);
    _appBet.image = [UIImage imageNamed:[NSString stringWithFormat:@"number%d.png",_appNumber]];
    _yourBet.image = [UIImage imageNamed:[NSString stringWithFormat:@"number%d.png",_changeNumber.selectedSegmentIndex]];
    
    
    _totalBetNumber = _appNumber + _changeNumber.selectedSegmentIndex;
    
    //Contition to result of game impasse.
    if((_changeImpasse.selectedSegmentIndex == 0 && _totalBetNumber%2 != 0) || (_changeImpasse.selectedSegmentIndex == 1 && _totalBetNumber%2 == 0) )
    {
        _resultOfYourBet.text = [NSString stringWithFormat:@"Você Venceu!!"];
        _resultOfYourBet.textColor = [UIColor greenColor];
    }else
    {
        _resultOfYourBet.text = [NSString stringWithFormat:@"Você Perdeu!!"];
        _resultOfYourBet.textColor = [UIColor redColor];
    }
}
    

@end
