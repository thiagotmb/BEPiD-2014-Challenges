//
//  TMBUserDetailViewController.m
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBUserDetailViewController.h"

@interface TMBUserDetailViewController ()

@end

@implementation TMBUserDetailViewController

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
    self.userSalary.text = self.userSalaryText;
    self.userPhoto.image = self.userPhotoImage;
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
