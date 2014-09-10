//
//  TMBData.h
//  Challenge_20140707_NavigationController
//
//  Created by Thiago on 7/7/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBData : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) int age;
@property (nonatomic) float height;
@property (nonatomic) float weight;


+ (id) sharedData;

- (id) getSharedName;
- (void) setSharedName: (NSString*) name;

- (int) getSharedAge;
- (void) setSharedAge: (int) age;

- (float) getSharedHeight;
- (void) setSharedHeight: (float) height;

- (float) getSharedWeight;
- (void) setSharedWeight: (float) weight;


@end
