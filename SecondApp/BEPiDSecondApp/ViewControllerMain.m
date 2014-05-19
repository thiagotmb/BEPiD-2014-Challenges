//
//  ViewControllerMain.m
//  BEPiDSecondApp
//
//  Created by Thiago on 5/15/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "ViewControllerMain.h"

@interface ViewControllerMain ()

@end

@implementation ViewControllerMain


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)inputViewType:(UITextField *)type
{
    UIPickerView *picker = [[UIPickerView alloc]
                            initWithFrame:CGRectMake(0, 244, 320, 270)];
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];


}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 1;
}


@end
