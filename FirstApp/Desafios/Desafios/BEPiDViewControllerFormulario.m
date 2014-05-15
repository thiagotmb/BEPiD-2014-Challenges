//
//  BEPiDViewControllerFormulario.m
//  Desafios
//
//  Created by Thiago on 5/14/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "BEPiDViewControllerFormulario.h"

@interface BEPiDViewControllerFormulario ()

@end

@implementation BEPiDViewControllerFormulario

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
    _data = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setAge:(id)sender {
    
    int valueOfAge = (int)floorf(_ageSlider.value);
    NSString *ageLabelText = [[NSString alloc] initWithFormat:@"%d",valueOfAge];
    _yourAge.text = ageLabelText;
    
}

- (IBAction)clearAllForm:(id)sender {
    
    _yourName.text = nil;
    _ageSlider.value = 0;
    _yourAge.text = nil;
    _yourEmail.text = nil;
    _yourPhoneNumber.text = nil;
    _yourUniversity.text = nil;
    _yourCourse.text = nil;
    
}

- (IBAction)submitForm:(id)sender {
    
    NSMutableDictionary *store = [[NSMutableDictionary alloc] init];
    
    [store setObject:[NSDate date] forKey:@"Date:"];
    [store setObject:[NSString stringWithFormat:@"%@",_yourName] forKey:@"Name:"];
    [store setObject:[NSNumber numberWithInt:(int)floorf(_ageSlider.value)] forKey:@"Age:"];
    [store setObject:[NSString stringWithFormat:@"%@",_yourEmail] forKey:@"E-mail:"];
    [store setObject:_yourPhoneNumber.text forKey:@"Phone Number:"];
    [store setObject:[NSString stringWithFormat:@"%@",_yourUniversity] forKey:@"University:"];
    [store setObject:[NSString stringWithFormat:@"%@",_yourCourse] forKey:@"Course:"];
    
    [_data addObject:store];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"historic.plist"];
    [_data writeToFile:appFile atomically:YES];
    
    BEPiDViewControllerOk *sucess = [[BEPiDViewControllerOk alloc]init];
    
    [self presentViewController:sucess animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
