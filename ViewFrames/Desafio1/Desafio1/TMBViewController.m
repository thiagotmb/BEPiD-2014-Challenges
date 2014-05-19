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

- (IBAction)drawSquare:(id)sender {
    
    CGRect frame = CGRectMake(_xPosition.text.floatValue, _yPosition.text.floatValue + (_backFormView.frame.origin.y + _backFormView.frame.size.height), _widthSize.text.floatValue, _heigthSize.text.floatValue);
    
    UIView *drawLabel = [[UIView alloc] initWithFrame:frame];

    switch(_colorDraw.selectedSegmentIndex)
    {
        case 0:
            drawLabel.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            drawLabel.backgroundColor = [UIColor blueColor];
        case 2:
            drawLabel.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            drawLabel.backgroundColor = [UIColor redColor];
            break;
        case 4:
            drawLabel.backgroundColor = [UIColor yellowColor];
            break;
    }
    
    [_drawView setFrame:frame];
    [_drawView addSubview:drawLabel];
    self.view = _drawView;
  
}


- (IBAction)backForm:(id)sender {
    
    self.view = _formView;
}
@end
