//
//  TMBItemStore.h
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMBItem;
@interface TMBItemStore : NSObject

@property(nonatomic, readonly) NSArray* allItems;

+(instancetype)sharedStore;
-(TMBItem*)createItem;
-(void)removeItemAtIndex:(NSInteger)index;
-(void)moveItemFrom:(NSInteger)currentIndex to:(NSInteger)destineIndex;

@end
