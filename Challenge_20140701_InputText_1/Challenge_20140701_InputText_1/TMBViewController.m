//
//  TMBViewController.m
//  Challenge_20140701_InputText_1
//
//  Created by Thiago Bernardes on 7/1/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"

#define PLISTNAME @"UserData.plist"

@interface TMBViewController ()

@end

@implementation TMBViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        [self setUpDatabase];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _submitAlert = [[UIAlertView alloc ] initWithTitle:@"Cadastrado com sucesso" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    _submitCheckAlert = [[UIAlertView alloc ] initWithTitle:@"Deseja salvar os dados?" message:nil delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Salvar", nil];

    
    _nameInputExceptionAlert = [[UIAlertView alloc ] initWithTitle:@"O nome deve conter no minimo 2 letras" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    _cpfInputExceptionAlert = [[UIAlertView alloc ] initWithTitle:@"O CPF deve conter 11 dígitos" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    _passWordInputExceptionAlert = [[UIAlertView alloc ] initWithTitle:@"O CPF deve conter 6 dígitos, 2 letras maíusculas e 2 números" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)submitForm:(id)sender {
    
    [_submitCheckAlert show];
    
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(alertView == _submitCheckAlert){
        if(buttonIndex == 1){
            if([self validateAllFields]){
                [self saveFormData];
                [_submitAlert show];
            }
        }
        if (buttonIndex == 0)
            [self resignFirstResponder];
        
    }
    
    if(alertView == _nameInputExceptionAlert)
        [_name becomeFirstResponder];
    
    if(alertView == _cpfInputExceptionAlert)
        [_cpf becomeFirstResponder];
    
    if(alertView == _passWordInputExceptionAlert)
        [_password becomeFirstResponder];
    
}

/*
 Param:nil
 Function: This method search the App documents file directore,and initialize a data array of objects
 Return:nil
 */

-(void)setUpDatabase{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    _appFileFolder = [documentsDirectory stringByAppendingPathComponent:PLISTNAME]; NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: _appFileFolder])
    {
        _appFileFolder = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: PLISTNAME] ];
    }
    
    
    
    if ([fileManager fileExistsAtPath: _appFileFolder]) //If plist exists, load data from plist in a array
    {
        _dataToSave = [[NSMutableArray alloc] initWithContentsOfFile: _appFileFolder];
    }
    else        // If the file doesn’t exist, create an empty array

    {
        _dataToSave     = [[NSMutableArray alloc] init];
    }
    

}


/*
 Param:nil
 Function: This method alloc a TMBData object, Store the text fields data in TMBData properties, Encode the TMBData object and append in a array of TMBData objects, finally store the array in a plist 
 Return:nil

 */
-(void)saveFormData{
    
    _usersData = [[TMBData alloc] init];

    _usersData.name = _name.text;
    _usersData.cpf = _cpf.text;
    _usersData.phoneNumber = _phoneNumber.text;
    _usersData.passWord = _password.text;
    _usersData.signUp = [NSDate date];
    
    _objectTMBData = [NSKeyedArchiver archivedDataWithRootObject:_usersData];
    [_dataToSave addObject:_objectTMBData];
    
    [_dataToSave writeToFile:_appFileFolder atomically:YES];
    
}


/*
 Param:nil
 Function: Is a bonus of my challenge hehe :) , i learn how to retrieve a data encoded data and assign to a new object, and present this datas when user clicks in a button NSLOG PLIST
 Return:nil

 */
- (IBAction)showPlistData:(id)sender {
    
    
    NSMutableDictionary *plistData = [[NSMutableDictionary alloc] init];
    
    unsigned int userNumber = 1;
    for (_objectTMBData in _dataToSave) {
        _usersData = [NSKeyedUnarchiver unarchiveObjectWithData:_objectTMBData];
        
        plistData = [NSMutableDictionary dictionaryWithObjectsAndKeys: [NSString stringWithFormat:@"%d",userNumber], @"User Number: ", _usersData.name, @"Name:",_usersData.cpf, @"CPF:", _usersData.phoneNumber, @"Phone Number:",_usersData.passWord, @"PassWord:", _usersData.signUp,@"Date of SigUp",nil];
        
        NSLog(@"%@",plistData);
        
        userNumber++;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Hide keyboard if touches
    [self.view endEditing:YES];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    
    //Go to next text field
    if (textField == _name) {
        
        if([self validateName])
            [_cpf becomeFirstResponder];
        
    }else if (textField == _cpf) {
        
        if([self validateCPF])
            [_phoneNumber becomeFirstResponder];
        
    }else if (textField == _phoneNumber) {

        //empty
        
    }else if (textField == _password) {
        
        if([self validatePassWord])
            [_password resignFirstResponder];
        
    }
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    if(textField == _phoneNumber)
            return [self maskPhoneNumber:range];
    
    if(textField == _cpf)
        return [self maskCPF:range];
    
    
    return YES;
}


/*
 Param:(NSRange)range -> range of text in _phoneNumber text field to be replaced
 Function: this method check a range of phoneNumber, and add a mask in entered number in selected region
 Return:BOOL, return yes if character not excepted the max length, or else return NO, for the user can't entry more numbers;
 
 */
-(BOOL)maskPhoneNumber:(NSRange)range{
    
    
    NSInteger phoneNumberlength = [self getNumbersLength:_phoneNumber.text];
    if(phoneNumberlength == 13)
    {
        if(range.length == 0)
            return NO;
    }
    
    if(phoneNumberlength == 2)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_phoneNumber.text];
        _phoneNumber.text = [NSString stringWithFormat:@"[+%@]",unmaskedNumber];
        if(range.length > 0)
            _phoneNumber.text = [NSString stringWithFormat:@"%@",[unmaskedNumber substringToIndex:2]];
        
    }else if(phoneNumberlength == 5)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_phoneNumber.text];
        
        _phoneNumber.text = [NSString stringWithFormat:@"[+%@](%@)",[unmaskedNumber  substringToIndex:2],[unmaskedNumber substringFromIndex:2]];
        if(range.length > 0)
            _phoneNumber.text = [NSString stringWithFormat:@"[+%@]%@",[unmaskedNumber substringToIndex:2],[unmaskedNumber substringFromIndex:2]];
        
        _lastPhoneNumber = _phoneNumber.text;
    }
    else if(phoneNumberlength == 9)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_phoneNumber.text];
        _phoneNumber.text = [NSString stringWithFormat:@"%@%@-",_lastPhoneNumber,[unmaskedNumber substringFromIndex:5]];
        if(range.length > 0)
            _phoneNumber.text = [NSString stringWithFormat:@"%@%@",_lastPhoneNumber,[unmaskedNumber substringFromIndex:5]];
        
    }

    return YES;
    
}
/*
 Param:(NSRange)range -> range of text in _cpf text field to be replaced
 Function: this method check a range of _cpf, and add a mask in entered number in selected region
 Return:BOOL, return yes if character not excepted the max length, or else return NO, for the user can't entry more numbers;
 
 */
-(BOOL)maskCPF:(NSRange)range{
    
    
    NSInteger cpfNumberLength = [self getNumbersLength:_cpf.text];
    
    if(cpfNumberLength == 11)
    {
        if(range.length == 0)
            return NO;
    }
    
    if(cpfNumberLength == 3)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_cpf.text];
        _cpf.text = [NSString stringWithFormat:@"%@.",unmaskedNumber];
        if(range.length > 0)
            _cpf.text = [NSString stringWithFormat:@"%@",[unmaskedNumber substringToIndex:3]];
        
    }else if(cpfNumberLength == 6)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_cpf.text];
        
        _cpf.text = [NSString stringWithFormat:@"%@.%@.",[unmaskedNumber  substringToIndex:3],[unmaskedNumber substringFromIndex:3]];
        if(range.length > 0)
            _cpf.text = [NSString stringWithFormat:@"%@.%@",[unmaskedNumber substringToIndex:3],[unmaskedNumber substringFromIndex:3]];
        
        _lastCPFNumber = _cpf.text;
    }else if(cpfNumberLength == 9)
    {
        NSString *unmaskedNumber = [self unmaskNumber:_cpf.text];
        _cpf.text = [NSString stringWithFormat:@"%@%@/",_lastCPFNumber,[unmaskedNumber substringFromIndex:6]];
        if(range.length > 0)
            _cpf.text = [NSString stringWithFormat:@"%@%@",_lastCPFNumber,[unmaskedNumber substringFromIndex:6]];
                
    }

    
    return YES;
    
}

/*
 Param:(NSString)number -> the number text to be clean
 Function: this method UnMask a masked number, for this  number is used to a new mask
 Return:NSString new  number without especial characters of mask
 
 */
-(NSString*)unmaskNumber:(NSString*)number{
    number = [number stringByReplacingOccurrencesOfString:@"[" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"]" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"(" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@")" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@" " withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"-" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"+" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"." withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSInteger phoneNumberlength = [number length];
    if(phoneNumberlength >13)
    {
        number = [number substringFromIndex: phoneNumberlength-9];
        
    }
    
    
    return number;
}



/*
 Param:(NSString)number -> the number text to get length
 Function: this method unmask and get a length for a  number
 Return:NSInteger the unmasked number length
 
 */
-(NSInteger)getNumbersLength:(NSString*)number{
    

    number = [self unmaskNumber:number];
    
    NSInteger phoneNumberlength = [number length];
    
    return phoneNumberlength;
    
    
}

/*
 Param:nil
 Function: this method verify in name text fild if number of letters is bigger than 1
 Return:BOOL return YES if is a valid name or NO if isn't
 
 */
-(BOOL)validateName{
    
    if(_name.text.length >1)
        return YES;
    else{
        [_nameInputExceptionAlert show];
        return NO;
    }
    

    
    return NO;
    
}

/*
 Param:nil
 Function: this method verify in cpf  text field if number of letters is bigger than 11
 Return:BOOL return YES if is a valid CPF or NO if isn't
 
 */
-(BOOL)validateCPF{
    
    if(_name.text.length == 11)
        return YES;
    else{
        [_cpfInputExceptionAlert show];
        return NO;
    }
}

/*
 Param:nil
 Function: this method verify in password text field if number of letters is bigger than 6, and contains minimum 2 cappitalized letters and 2 numbers
 Return:BOOL return YES if is a valid PassWord or NO if isn't
 
 */
-(BOOL)validatePassWord{
    
    int upperCaseLetters = 0;
    int numberLetters = 0;
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    for (int i=0; i<_password.text.length; i++){
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[_password.text characterAtIndex:i]])
            upperCaseLetters++;
        if([numbers characterIsMember:[_password.text characterAtIndex:i]])
            numberLetters++;
    }
    
    
    if(_password.text.length >=6 && upperCaseLetters>1 && numberLetters>1){
        return YES;
    }
    else{
        [_passWordInputExceptionAlert show];
        return NO;
    }
    

}
/*
 Param:nil
 Function: this method is BONUS of challenge, this validate all fileds and return if is valids, in momento of submit, isn`t valid, the data isn`t stored.
 Return:BOOL return YES if all fileds of view controller is valid or NO if isn't
 
 */
-(BOOL)validateAllFields{
    
   if(![self validateName])
       return NO;
   if(![self validatePassWord])
        return NO;
    if([self validateCPF])
        return NO;
    
    return YES;
}
@end
