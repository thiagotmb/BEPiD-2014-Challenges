//
//  TMBNavigationController.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBNavigationController.h"


@interface TMBNavigationController ()

@end

@implementation TMBNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        TMBStatusViewController *childViewController = [[TMBStatusViewController alloc] initWithNibName:@"TMBStatusViewController" bundle:nil];
        [self addChildViewController:childViewController];
    }
    return self;
}




-(void)viewWillAppear:(BOOL)animated{
    
    NSString* pageIndex = [NSString stringWithFormat:@"%d",_pageIndex];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypePageIndex withData:pageIndex];

    [[TMBSharedData sharedData] setUpDatabase];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
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
