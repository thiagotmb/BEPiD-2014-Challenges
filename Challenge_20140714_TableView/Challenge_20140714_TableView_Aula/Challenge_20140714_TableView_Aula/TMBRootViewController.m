//
//  TMBRootViewController.m
//  Challenge_20140714_TableView_Aula
//
//  Created by Thiago Bernardes on 7/14/14.
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _rootScrollView.contentSize = self.view.bounds.size;
   // CGSizeMake(320, 800);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
