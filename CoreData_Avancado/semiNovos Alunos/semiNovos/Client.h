//
//  Client.h
//  semiNovos
//
//  Created by Thiago-Bernardes on 10/8/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>


@interface Client : NSManagedObject

@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) UIImage* photo;
@property (nonatomic, retain) UIImage* thumbnail;
@property (nonatomic, retain) NSManagedObject *own;

-(void)setThumbnailFromImage:(UIImage*)image;

@end
