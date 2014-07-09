//
//  TMBViewControllerEditable.h
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBData.h"


@interface TMBViewControllerEditable : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;


@end
