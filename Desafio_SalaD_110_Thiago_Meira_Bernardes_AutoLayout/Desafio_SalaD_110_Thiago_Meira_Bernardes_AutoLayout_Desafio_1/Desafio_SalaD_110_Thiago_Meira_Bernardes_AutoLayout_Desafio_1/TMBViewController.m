//
//  TMBViewController.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_AutoLayout_Desafio_1
//
//  Created by Thiago Bernardes on 7/28/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"

@interface TMBViewController ()

- (IBAction)changeViewPoints:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (nonatomic) BOOL thisChanged;

@end

@implementation TMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _thisChanged = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeViewPoints:(id)sender {
    if (!_thisChanged) {
        _viewHeight.constant = 50.0f;
        _thisChanged = YES;
    }else{
        _viewHeight.constant = 120.0f;
        _thisChanged = NO;
    }
}
@end
