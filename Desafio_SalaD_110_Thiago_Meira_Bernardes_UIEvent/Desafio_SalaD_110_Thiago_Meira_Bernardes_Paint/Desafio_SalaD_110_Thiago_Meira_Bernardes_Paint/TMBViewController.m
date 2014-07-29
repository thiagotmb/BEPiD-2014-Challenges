//
//  TMBViewController.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_Paint
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"


@interface TMBViewController ()

@end

@implementation TMBViewController


-(id)init{
    
    self = [super init];
    if (self) {
        
        _paintView = [[TMBView alloc ] initWithFrame:CGRectZero];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view = _paintView;
    // Do any additional setup after loading the view.
}



@end
