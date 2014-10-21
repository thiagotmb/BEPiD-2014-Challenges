//
//  ViewController.m
//  Animation
//
//  Created by Thiago-Bernardes on 10/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameRect = CGRectMake(50, 50, 50, 50);
    _boxView = [[UIView alloc] initWithFrame:frameRect];
    _boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_boxView];
    
    /* [UIView animateWithDuration:3.0 animations:^{
        
        boxView.alpha = 0.0;
         //[boxView setFrame:CGRectMake(100, 100, 100, 100)];
         
    }];
    */
    
    _scaleFactor = 2;
    _angle = 100;
  /*
    [UIView animateWithDuration:3.0 delay:5.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        boxView.alpha = 0;
        
        
    }completion:^(BOOL finished){
        
        [UIView animateWithDuration:1.0 animations:^{
            
            boxView.alpha = 1;
        }];

    }
     ]; */
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGAffineTransform scaleTrans = CGAffineTransformMakeScale(_scaleFactor, _scaleFactor);
        CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(_angle*M_PI /180);
        
        _boxView.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);
        
        _angle = (_angle == 180 ? 360 :180 );
        _scaleFactor = (_scaleFactor == 2 ? 1 : 2 );
        _boxView.center = location;
    }completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
