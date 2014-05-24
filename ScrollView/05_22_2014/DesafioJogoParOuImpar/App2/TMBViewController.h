//
//  TMBViewController.h
//  App2
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *changeImpasse;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeNumber;


- (IBAction)play:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *yourBet;
@property (weak, nonatomic) IBOutlet UILabel *resultOfYourBet;
@property (weak, nonatomic) IBOutlet UIImageView *appBet;

@property (nonatomic) unsigned int appNumber;
@property (nonatomic) unsigned int totalBetNumber;



- (void)gameRun;



@end
