//
//  TMBMainViewController.m
//  App1
//
//  Created by Thiago on 5/22/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBMainViewController.h"

@interface TMBMainViewController ()

@end

@implementation TMBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        TMBScrollView *mainScrollView = [[TMBScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview:mainScrollView];
        
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

@end
