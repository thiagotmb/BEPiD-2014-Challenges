//
//  TMBViewController.m
//  Desafio1
//
//  Created by Thiago on 5/19/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)setBackgroundColor:(CGContextRef*)context
{
    switch(_colorDraw.selectedSegmentIndex)
    {
        case 0:
             CGContextSetFillColorWithColor(*context, [UIColor blackColor].CGColor);
            break;
        case 1:
            CGContextSetFillColorWithColor(*context, [UIColor blueColor].CGColor);
            break;
        case 2:
            CGContextSetFillColorWithColor(*context, [UIColor greenColor].CGColor);;
            break;
        case 3:
            CGContextSetFillColorWithColor(*context, [UIColor redColor].CGColor);
            break;
        case 4:
            CGContextSetFillColorWithColor(*context, [UIColor yellowColor].CGColor);
            break;
    }

}

-(void)goToView:(UIView *)viewToGo
{
    self.view = viewToGo;
}

- (IBAction)drawByType:(id)sender {
    
    if(_typeOfDraw.selectedSegmentIndex == 0)
        [self drawSquare];
    else
        [self drawElipse];
}


- (void)drawElipse{
    
    CGRect frame = CGRectMake(_xPosition.text.floatValue, _yPosition.text.floatValue + (_backFormView.frame.origin.y + _backFormView.frame.size.height), _widthSize.text.floatValue, _heigthSize.text.floatValue);
    
    
    
    UIBezierPath *circle = [UIBezierPath
                            bezierPathWithOvalInRect:frame];
    UIGraphicsBeginImageContext(_drawView.bounds.size);
    
  
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self setBackgroundColor:&context];
    [circle fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    UIImageView *bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];

    [_drawView addSubview:bezierImageView];
    [self goToView:_drawView];
  
    
    
}
- (void)drawSquare{
    
    CGRect frame = CGRectMake(_xPosition.text.floatValue, _yPosition.text.floatValue + (_backFormView.frame.origin.y + _backFormView.frame.size.height), _widthSize.text.floatValue, _heigthSize.text.floatValue);
    
    
    
    UIBezierPath *square = [UIBezierPath
                            bezierPathWithRect:frame];
    UIGraphicsBeginImageContext(_drawView.bounds.size);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self setBackgroundColor:&context];
    [square fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    UIImageView *bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    
    [_drawFrame addSubview:bezierImageView];
    [_drawView addSubview:_drawFrame];
    [self goToView:_drawView];
    
    
    
}


- (IBAction)clearView:(id)sender {
    
    [_drawFrame removeFromSuperview];
    
}

- (IBAction)backForm:(id)sender {
    
    self.view = _formView;
    
}
@end
