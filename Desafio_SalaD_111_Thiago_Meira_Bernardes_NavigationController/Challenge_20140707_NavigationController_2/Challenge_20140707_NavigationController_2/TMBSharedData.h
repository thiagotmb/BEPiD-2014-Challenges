//
//  TMBSharedData.h
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TMBSharedData : NSObject

@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic)  NSString *model;
@property (strong, nonatomic)  NSString *plaque;
@property (strong, nonatomic)  NSString *coust;
@property (strong, nonatomic)  NSString *state;
@property (strong, nonatomic)  NSString *startDate;
@property (strong, nonatomic)  NSDate *endDate;

@property (nonatomic) NSString* pageIndex;
@property (nonatomic) NSString *appFilePath;
@property (nonatomic) NSMutableArray *cars;
@property (nonatomic) NSMutableDictionary *selectedCar;


enum TMBDataType : NSUInteger{
    
    TMBDataTypePageIndex = 0,
    TMBDataTypeName = 1,
    TMBDataTypeModel = 2,
    TMBDataTypePlaque = 3,
    TMBDataTypeCoust = 4,
    TMBDataTypeState = 5,
    TMBDataTypeStartDate = 6,
    TMBDataTypeEndDate = 7,
    
};


+(id)sharedData;

-(id)initPrivate;

-(id)getSharedData:(NSUInteger)TMBDataType;

-(void)setSharedData:(NSUInteger)TMBDataType withData:(NSString*)data;

-(void)setUpDatabase;
-(void)updateDatabase;
-(void)loadSharedData;

@end
