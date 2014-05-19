//
//  TMBViewController.h
//  Desafio1
//
//  Created by Thiago on 5/19/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *xPosition;

@property (strong, nonatomic) IBOutlet UITextField *yPosition;

@property (strong, nonatomic) IBOutlet UITextField *widthSize;

@property (strong, nonatomic) IBOutlet UITextField *heigthSize;

@property (strong, nonatomic) IBOutlet UISegmentedControl *colorDraw;

- (IBAction)drawSquare:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *formView;

@property (strong, nonatomic) IBOutlet UIView *drawView;

@property (strong, nonatomic) IBOutlet UIButton *backFormView;

- (IBAction)backForm:(id)sender;

@end
