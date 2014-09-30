//
//  BPDViewController.m
//  Aula01_WebService
//
//  Created by Antonio Silva on 22/09/14.
//  Copyright (c) 2014 Antonio Silva. All rights reserved.
//

#import "BPDViewController.h"
#import "BPDAppDelegate.h"

@interface BPDViewController ()



@end

@implementation BPDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString* tryLogin = [userDefaults objectForKey:@"TryLogin"];
    
    if ([tryLogin isEqualToString:@"YES"]) {
        NSString* user = [userDefaults objectForKey:@"User"];
        NSString* pass = [userDefaults objectForKey:@"Pass"];
        [self loginWithUser:user password:pass];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)entrar:(id)sender {
    NSString *user = self.usuario.text;
    NSString *pass = self.senha.text;
    
    [self loginWithUser:user password:pass];
    
}

-(BOOL)loginWithUser:(NSString*)user password:(NSString*)pass{
    
    NSInteger sucess = 0;
    
    @try {
        if([user isEqualToString:@""] || [pass isEqualToString:@""]) {
            [self alertView:NSLocalizedString(@"BLANK_LOGIN",nil) withMessage:            NSLocalizedString(@"ENTER_WITH_VALID_USER_OR_PASSWORD",nil)
             ];
            
        } else{
            
            NSString* post = [NSString stringWithFormat:@"username=%@&password=%@",user,pass];
            NSLog(@"PostData: %@", post);
            NSData* postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString* postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
            
            
            
            NSURL *url = [NSURL URLWithString:@"http://172.16.3.184:8888/jsonlogin.php"];
            NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
            
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //            [NSURLRequest class ]
            
            NSError* error = [[NSError alloc] init];
            
            NSHTTPURLResponse *response = nil;
            
            NSData* urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300) {
                
                NSString* responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                
                NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                
                NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error];
                
                sucess = [jsonData[@"sucess"] integerValue];
                
                NSLog(@"Sucess: %ld",(long) sucess);
                
                if (sucess == 1) {
                    NSLog(@"Login Sucess");
                    
                }else{
                    
                    NSString* error_msg = (NSString*) jsonData[@"error_message"];
                    [self alertView:error_msg withMessage:NSLocalizedString(@"LOGIN_FAILED", nil) ];
                }
                
            }else{
                
                [self alertView:NSLocalizedString(@"CONNECTION_FAILED", nil) withMessage:NSLocalizedString(@"LOGIN_FAILED", nil)];
            }
            
        }
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception: %@", exception);
        [self alertView:NSLocalizedString(@"LOGIN_FAILED", nil) withMessage:@"Error"];
        
    }
    if (sucess) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:user forKey:@"User"];
        [userDefaults setObject:pass forKey:@"Pass"];
        [userDefaults setObject:@"YES" forKey:@"TryLogin"];
        NSLog(@" logado user:%@, pass:%@",user,pass);
        [self performSegueWithIdentifier:@"login_sucess" sender:self];
    }
    


    return sucess;
    
}


- (void) alertView:(NSString *) title withMessage:(NSString *) message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}


@end
