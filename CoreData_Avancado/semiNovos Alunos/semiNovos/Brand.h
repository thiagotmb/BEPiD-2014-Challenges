//
//  Brand.h
//  semiNovos
//
//  Created by Thiago-Bernardes on 10/8/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Brand : NSManagedObject

@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSManagedObject *car;

@end
