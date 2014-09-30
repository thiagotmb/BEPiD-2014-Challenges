//
//  BPDViewController.h
//  Aula01_WebService
//
//  Created by Antonio Silva on 22/09/14.
//  Copyright (c) 2014 Antonio Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usuario;
@property (weak, nonatomic) IBOutlet UITextField *senha;

- (IBAction)entrar:(id)sender;

@end
