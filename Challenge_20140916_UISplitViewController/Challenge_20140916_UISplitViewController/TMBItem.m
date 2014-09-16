//
//  TMBItem.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBItem.h"

#define firstArrayName @[@"iPhone",@"iPad",@"iMac",@"MacBook",@"MacMini",@"iPod"];

#define secondArrayName @[@"Antonio",@"Bruno",@"Cezar",@"Daniel",@"Elton",@"Fábio",@"Guilherme"];

@implementation TMBItem{
    
}

-(NSDate *)dateCreated{
    
    return [NSDate date];
}

-(instancetype)initWithItemName:(NSString *)name value:(int)value serialNumber:(NSString *)sNumber{
    
    self = [super init];
    
    if(self){
        
        self.itemName = name;
        self.value = value;
        self.serialNumber = sNumber;
        
    }
    
    return self;
    
}



-(instancetype)initWithItemName:(NSString *)name{
    
    self = [super init];
    if (self) {
        self.itemName = name;
    }
    return self;
    
}

+(instancetype)randomItem{

    
    int firstRandomItem = [self randomNumberBetween:0 and:6];
    int secondRandomItem = [self randomNumberBetween:0 and:7];
    
    NSArray *first = firstArrayName
    NSArray *second = secondArrayName;

    NSString* itemName = [NSString stringWithFormat:@"%@ do %@",first[firstRandomItem],second[secondRandomItem]];
    
    
    int itemValue = [self randomNumberBetween:0 and:15000];
    
    NSString* itemSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",[self randomNumberBetween:48 and:57],[self randomNumberBetween:97 and:122],[self randomNumberBetween:48 and:57],[self randomNumberBetween:97 and:122],[self randomNumberBetween:48 and:57]];
    
    TMBItem *randomItem = [[TMBItem alloc] initWithItemName:itemName value:itemValue serialNumber:itemSerialNumber];
    
    return randomItem;
    
}

+(int)randomNumberBetween:(int)lessNumber and:(int)biggerNumber{
    int randomNumber = arc4random() % (biggerNumber - lessNumber) + lessNumber;
    return randomNumber;
}

@end
