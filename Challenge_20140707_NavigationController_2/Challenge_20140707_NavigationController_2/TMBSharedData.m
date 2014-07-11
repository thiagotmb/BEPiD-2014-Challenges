//
//  TMBSharedData.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBSharedData.h"

@implementation TMBSharedData


+(id)sharedData{
    
    static TMBSharedData *sharedData = nil;
    
    if(!sharedData){
        
        sharedData = [[self alloc] initPrivate];
        
        
    }
    
    return sharedData;
}


-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBData shadredData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if(self){
        
        _name = [[NSString alloc] init];
        _name = @"Name Default";
        
        _model = [[NSString alloc] init];
        _model = @"Model Default";
        
        _plaque = [[NSString alloc] init];
        _plaque = @"Plaque Default";
        
        _coust = [[NSString alloc] init];
        _coust = @"Coust Default";
        
        _state = [[NSString alloc] init];
        _state = @"State Default";
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSString *dateString;
        dateString = [dateFormat stringFromDate:[NSDate date]];
        
        _startDate = dateString;
        
        _endDate = [NSDate date];
        
    }
    
    return self;
    
}

-(id)getSharedData:(NSUInteger)TMBDataType{
    
    switch (TMBDataType) {
            
        case TMBDataTypePageIndex:
            return _pageIndex;
        break;
            
        case TMBDataTypeName:
            return _name;
            break;
            
        case TMBDataTypeModel:
            return _model;
            break;
            
        case TMBDataTypePlaque:
            return _plaque;
            break;
            
        case TMBDataTypeCoust:
            return _coust;
            break;
            
        case TMBDataTypeState:
            return _state;
            break;
            
        case TMBDataTypeStartDate:
            return _startDate;
            break;
            
        case TMBDataTypeEndDate:
            return _endDate;
            break;
            
        default:
            return nil;
            break;
    }
    
}


-(void)setSharedData:(NSUInteger)TMBDataType withData:(NSString *)data{
    
    switch (TMBDataType) {
        
        case TMBDataTypePageIndex:
            _pageIndex = data;
        break;
            
        case TMBDataTypeName:
            _name = data;
            break;
            
        case TMBDataTypeModel:
            _model = data;
            break;
            
        case TMBDataTypePlaque:
            _plaque = data;
            break;
            
            
        case TMBDataTypeCoust:
            _coust = data;
            break;
            
        case TMBDataTypeState:
            _state = data;
            break;
            
        case TMBDataTypeStartDate:
            _startDate = data;
            break;
            
        case TMBDataTypeEndDate:{
            
            _endDate = data;
            break;
        }
        default:
            NSLog(@"Invalid Data Type");
            break;
    }
}

-(void)setUpDatabase{
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fileFolder = [folders objectAtIndex:0];
    
    NSError *erro;
    NSString *path = [fileFolder stringByAppendingString:@"/CarsData.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:path]){
        NSString *pathToSettingsInBundle = [[NSBundle mainBundle] pathForResource:@"CarsData" ofType:@"plist"];
        [fileManager copyItemAtPath:pathToSettingsInBundle toPath:path error:&erro];
    }
    
    _appFilePath = [fileFolder stringByAppendingPathComponent:@"CarsData.plist"];
    
    _cars = [[[NSMutableArray alloc]initWithContentsOfFile:_appFilePath]mutableCopy];
    [self loadSharedData];
    
}

-(void)updateDatabase{
    
    _selectedCar = [NSMutableDictionary dictionaryWithDictionary:[_cars objectAtIndex:[_pageIndex intValue]]];

    [_selectedCar setValue:[[TMBSharedData sharedData]getSharedData:TMBDataTypeState]
                    forKey:@"State"];
    
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString * dateToSet = [formatter stringFromDate:[[TMBSharedData sharedData]getSharedData:TMBDataTypeEndDate]];
    
    [_selectedCar setValue:dateToSet
                        forKey:@"EndDate"];
    
    [_cars setObject:_selectedCar atIndexedSubscript:[_pageIndex intValue]];
    
    
    [_cars writeToFile:_appFilePath atomically:YES];
    
}

-(void)loadSharedData{
    
    _selectedCar = [NSMutableDictionary dictionaryWithDictionary:[_cars objectAtIndex:[_pageIndex intValue]]];
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeName withData:[_selectedCar valueForKey:@"Name"]];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeModel withData:[_selectedCar valueForKey:@"Model"]];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypePlaque withData:[_selectedCar valueForKey:@"Plaque"]];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeCoust withData:[_selectedCar valueForKey:@"Coust"]];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeState withData:[_selectedCar valueForKey:@"State"]];
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeStartDate withData:[_selectedCar valueForKey:@"StartDate"]];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSDate * dateToSet = [formatter dateFromString:[_selectedCar valueForKey:@"EndDate"]];
    
    [[TMBSharedData sharedData] setSharedData:TMBDataTypeEndDate withData:dateToSet];
    
}

@end
