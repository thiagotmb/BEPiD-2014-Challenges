//
//  ViewController.m
//  Core_Animation
//
//  Created by Thiago-Bernardes on 10/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "ViewController.h"
#import "Triangle.h"
#import "Square.h"
@interface ViewController ()
@property( nonatomic) Triangle* squareView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Square *square = [[Square alloc] initWithFrame:CGRectMake(100,100, 100, 100)];
    square.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:square];
    
            
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
