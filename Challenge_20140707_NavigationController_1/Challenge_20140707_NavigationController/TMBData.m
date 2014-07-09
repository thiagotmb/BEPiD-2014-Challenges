//
//  TMBData.m
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBData.h"

@implementation TMBData


+(id)sharedData{
    
    static TMBData* sharedData = nil;
    
    if(!sharedData)
    {
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(id) init{
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBData shadredData" userInfo:nil];
    
    return nil;
    
}

-(id) initPrivate{
    
    self = [super init];
    
    if(self){
        
        _name = [[NSString alloc] init];
        _name = @"Name Default";
    }
    
    return self;
}

-(id)getSharedName{
    
    return self.name;
}

-(void)setSharedName:(NSString *)name{
    
    _name = name;

}

-(int)getSharedAge{
    
    return self.age;
}

-(void)setSharedAge:(int)age{
    
    _age = age ;
    
}

-(float)getSharedHeight{
    
    return self.height;
}

-(void)setSharedHeight:(float)height{
    
    _height = height ;
    
}

-(float)getSharedWeight{
    
    return self.weight;
}

-(void)setSharedWeight:(float)weight{
    
    _weight = weight ;
    
}

@end
