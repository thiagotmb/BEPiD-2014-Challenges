//
//  TMBViewController.h
//  Challenge_20140701_InputText_1
//
//
//
//  Created by Thiago Bernardes on 7/1/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBData.h"

@interface TMBViewController : UIViewController <UIAlertViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *cpf;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (nonatomic) UIAlertView *submitAlert;
@property (nonatomic) UIAlertView *submitCheckAlert;
@property (nonatomic) UIAlertView *nameInputExceptionAlert;
@property (nonatomic) UIAlertView *cpfInputExceptionAlert;
@property (nonatomic) UIAlertView *passWordInputExceptionAlert;



@property (nonatomic) NSString *appFileFolder;

@property (nonatomic) NSMutableArray* dataToSave;

@property (nonatomic) TMBData *usersData;

@property (nonatomic,strong) NSData* objectTMBData;

@property (nonatomic) NSString *lastPhoneNumber;

@property (nonatomic) NSString *lastCPFNumber;


-(IBAction)submitForm:(id)sender;

- (IBAction)showPlistData:(id)sender;

-(void)setUpDatabase;

-(void)saveFormData;

-(BOOL)maskPhoneNumber:(NSRange)range;

-(BOOL)maskCPF:(NSRange)range;

-(NSString*)unmaskNumber:(NSString*)number;

-(NSInteger)getNumbersLength:(NSString*)number;

-(BOOL)validateName;
-(BOOL)validateCPF;
-(BOOL)validatePassWord;
-(BOOL)validateAllFields;




@end
