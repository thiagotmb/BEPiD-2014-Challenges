//
//  TMBItem.h
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/18/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TMBItem : NSManagedObject

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic) int value;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic) double orderingValue;
@property (nonatomic,retain) NSString* itemOwner;

-(void)randomData;

-(int)randomNumberBetween:(int)lessNumber and:(int)biggerNumber;



@end
