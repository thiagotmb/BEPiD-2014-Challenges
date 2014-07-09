//
//  TMBData.h
//  Challenge_20140701_InputText_1
//
//  Created by Thiago Bernardes on 7/1/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBData : NSObject <NSCoding>

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *cpf;

@property (nonatomic,copy) NSString *phoneNumber;

@property (nonatomic,copy) NSString *passWord;

@property (nonatomic,copy) NSDate *signUp;


@end
