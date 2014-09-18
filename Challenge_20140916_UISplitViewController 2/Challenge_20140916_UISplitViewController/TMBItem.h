//
//  TMBItem.h
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBItem : NSObject

@property (nonatomic, copy) NSString* itemName;
@property (nonatomic, copy) NSString* serialNumber;
@property (nonatomic) int value;
@property (nonatomic, readonly) NSDate *dateCreated;

-(instancetype)initWithItemName:(NSString*)name
                          value:(int)value
                   serialNumber:(NSString*)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

+(instancetype)randomItem;

+(int)randomNumberBetween:(int)lessNumber and:(int)biggerNumber;

@end
