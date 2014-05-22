//
//  TMBViewController.m
//  Desafio1
//
//  Created by Thiago on 5/19/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBViewController.h"

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

-(void)setBackgroundColor:(UIView *)viewToSet
{
    switch(_colorDraw.selectedSegmentIndex)
    {
        case 0:
            viewToSet.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            viewToSet.backgroundColor = [UIColor blueColor];
        case 2:
            viewToSet.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            viewToSet.backgroundColor = [UIColor redColor];
            break;
        case 4:
            viewToSet.backgroundColor = [UIColor yellowColor];
            break;
    }
}

-(CGRect)createFrame
{
    CGRect frame = CGRectMake(_xPosition.text.floatValue, _yPosition.text.floatValue + (_backFormView.frame.origin.y + _backFormView.frame.size.height), _widthSize.text.floatValue, _heigthSize.text.floatValue);
    return frame;
}

- (IBAction)drawSquare:(id)sender {
    
    
    CGRect frame = [self createFrame];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    
    
    UIView *drawLabel = [[UIView alloc] initWithFrame:rectangle];

    [self setBackgroundColor:drawLabel];
    
    [_drawView setFrame:rectangle];
    [_drawView addSubview:drawLabel];
    
    self.view = _drawView;
  
}


- (IBAction)backForm:(id)sender {
    
    self.view = _formView;
}
@end
