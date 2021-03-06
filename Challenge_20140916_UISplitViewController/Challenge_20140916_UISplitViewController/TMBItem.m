//
//  TMBItem.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/18/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBItem.h"

#define firstArrayName @[@"iPhone",@"iPad",@"iMac",@"MacBook",@"MacMini",@"iPod"];

#define secondArrayName @[@"Antonio",@"Bruno",@"Cezar",@"Daniel",@"Elton",@"Fábio",@"Guilherme"];

@implementation TMBItem

@dynamic dateCreated;
@dynamic value;
@dynamic itemName;
@dynamic serialNumber;
@dynamic orderingValue;
@dynamic itemOwner;

-(NSDate *)dateCreated{
    
    return [NSDate date];
}


-(NSString *)description{
    
    return [NSString stringWithFormat:@"Order Value:%.2f,SerialNumber: %@",self.orderingValue,self.serialNumber];
}

-(void)randomData{
    
    
    int firstRandomItem = [self randomNumberBetween:0 and:6];
    int secondRandomItem = [self randomNumberBetween:0 and:7];
    
    NSArray *first = firstArrayName
    NSArray *second = secondArrayName;
    
    NSString* itemName = [NSString stringWithFormat:@"%@",first[firstRandomItem]];
    NSString* itemOwner = [NSString stringWithFormat:@"%@",second[secondRandomItem]];
    
    
    int itemValue = [self randomNumberBetween:0 and:15000];
    
    NSString* itemSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",[self randomNumberBetween:48 and:57],[self randomNumberBetween:97 and:122],[self randomNumberBetween:48 and:57],[self randomNumberBetween:97 and:122],[self randomNumberBetween:48 and:57]];
   
    self.itemName = itemName;
    self.serialNumber = itemSerialNumber;
    self.value = itemValue;
    self.itemOwner = itemOwner;
    
    
    
}

-(int)randomNumberBetween:(int)lessNumber and:(int)biggerNumber{
    int randomNumber = arc4random() % (biggerNumber - lessNumber) + lessNumber;
    return randomNumber;
}

- (void)awakeFromInsert
{
    [super awakeFromInsert];
    self.dateCreated = [NSDate date];
}

@end
