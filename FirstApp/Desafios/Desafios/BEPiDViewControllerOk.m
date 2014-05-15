//
//  BEPiDViewControllerOk.m
//  Desafios
//
//  Created by Thiago on 5/14/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "BEPiDViewControllerOk.h"

@interface BEPiDViewControllerOk ()

@end

@implementation BEPiDViewControllerOk

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

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)newForm:(id)sender {
    
    BEPiDViewControllerFormulario *newForm = [[BEPiDViewControllerFormulario alloc] init];
    [newForm clearAllForm:sender];
    [self presentViewController:newForm animated:YES completion:nil];
}
@end
