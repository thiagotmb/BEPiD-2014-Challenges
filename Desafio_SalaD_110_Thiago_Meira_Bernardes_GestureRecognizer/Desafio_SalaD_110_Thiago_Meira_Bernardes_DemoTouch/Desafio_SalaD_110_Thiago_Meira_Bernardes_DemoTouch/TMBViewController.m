//
//  TMBViewController.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_DemoTouch
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"
#import "TMBView.h"

@interface TMBViewController ()

@end

@implementation TMBViewController

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
    self.view = [[TMBView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
