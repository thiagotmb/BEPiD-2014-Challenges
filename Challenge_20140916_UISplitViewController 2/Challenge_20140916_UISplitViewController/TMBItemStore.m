//
//  TMBItemStore.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBItemStore.h"
#import "TMBItem.h"

@interface TMBItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation TMBItemStore

-(NSArray *)allItems{
    
    return [NSArray arrayWithArray:self.privateItems];
    
}

-(TMBItem *)createItem{
    
    TMBItem *item = [TMBItem randomItem];
    
    [self.privateItems addObject:item];
        
    return item;
    
}

+(instancetype)sharedStore{
    
    static TMBItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        
        sharedStore = [[self alloc] initPrivate];
        
    }
    
    return sharedStore;
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}

-(void)removeItemAtIndex:(NSInteger)index{
    
    [self.privateItems removeObjectAtIndex:index];
    
}

-(void)moveItemFrom:(NSInteger)currentIndex to:(NSInteger)destineIndex{
    
    TMBItem* item = [self.privateItems objectAtIndex:currentIndex];
    
    [self.privateItems removeObjectAtIndex:currentIndex];
    
    [self.privateItems insertObject:item atIndex:destineIndex];
    
}

@end
