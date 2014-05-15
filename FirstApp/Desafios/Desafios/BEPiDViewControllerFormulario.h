//
//  BEPiDViewControllerFormulario.h
//  Desafios
//
//  Created by Thiago on 5/14/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPiDViewControllerOk.h"

@interface BEPiDViewControllerFormulario : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *yourName;

@property (strong, nonatomic) IBOutlet UILabel *yourAge;

@property (strong, nonatomic) IBOutlet UISlider *ageSlider;

@property (strong, nonatomic) IBOutlet UITextField *yourEmail;

@property (strong, nonatomic) IBOutlet UITextField *yourPhoneNumber;

@property (strong, nonatomic) IBOutlet UITextField *yourUniversity;

@property (strong, nonatomic) IBOutlet UITextField *yourCourse;

@property (strong,nonatomic) NSMutableArray *data;

- (IBAction)setAge:(id)sender;

- (IBAction)clearAllForm:(id)sender;

- (IBAction)submitForm:(id)sender;


@end
