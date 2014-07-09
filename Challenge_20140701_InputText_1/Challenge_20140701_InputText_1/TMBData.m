//
//  TMBData.m
//  Challenge_20140701_InputText_1
//
//  Created by Thiago Bernardes on 7/1/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBData.h"

@implementation TMBData

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        
        _name = [aDecoder decodeObjectForKey:@"Name"];
        _cpf = [aDecoder decodeObjectForKey:@"CPF"];
        _phoneNumber = [aDecoder decodeObjectForKey:@"PhoneNumber"];
        _passWord = [ aDecoder decodeObjectForKey:@"PassWord"];
        _signUp = [ aDecoder decodeObjectForKey:@"DateOfSignUp"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:_name forKey:@"Name"];
    [encoder encodeObject:_cpf forKey:@"CPF"];
    [encoder encodeObject:_phoneNumber forKey:@"PhoneNumber"];
    [encoder encodeObject:_passWord forKey:@"PassWord"];
    [encoder encodeObject:_signUp forKey:@"DateOfSignUp"];
}

@end
