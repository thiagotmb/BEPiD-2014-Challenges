//
//  TMBItemStore.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBItemStore.h"
#import "TMBItem.h"

#pragma mark CoreData
@import CoreData;

@interface TMBItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

#pragma mark CoreData
@property(nonatomic,strong) NSManagedObjectContext *context;
@property(nonatomic,strong) NSManagedObjectModel *model;

-(NSString*)itemArchivePath;

@end

@implementation TMBItemStore

-(NSArray *)allItems{
    
    return [NSArray arrayWithArray:self.privateItems];
    
}

-(NSString *)itemArchivePath{
    
    
    NSString *string = [NSString stringWithFormat:@"%@/Documents/splitViewController",NSHomeDirectory()];

    return string;
}

-(TMBItem *)createItem{
    
    NSEntityDescription *itemEntityDescription = [NSEntityDescription entityForName:@"TMBItem" inManagedObjectContext:self.context];
    
    TMBItem *item = [[TMBItem alloc] initWithEntity:itemEntityDescription insertIntoManagedObjectContext:self.context];
    
    [item randomData];
    
    [self.privateItems addObject:item];
    [self updateOrderingValue];
    
    return item;
    
}

+(instancetype)sharedStore{
    
    static TMBItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        
        sharedStore = [[self alloc] initPrivate];
        
    }
    
    return sharedStore;
}

-(void)updateOrderingValue{
    
    int i=0;
    for (TMBItem *item in self.privateItems) {
        item.orderingValue = i;
        i++;
    }
    
}

-(void)removeItemAtIndex:(NSInteger)index{
    
    TMBItem *item = [self.privateItems objectAtIndex:index];
    [_context deleteObject:item];
    
    [self.privateItems removeObjectAtIndex:index];
    [self updateOrderingValue];
}

-(void)moveItemFrom:(NSInteger)currentIndex to:(NSInteger)destineIndex{
    
    TMBItem* item = [self.privateItems objectAtIndex:currentIndex];
    
    [self.privateItems removeObjectAtIndex:currentIndex];
    
    [self.privateItems insertObject:item atIndex:destineIndex];
    [self updateOrderingValue];
    
}


#pragma mark CoreData

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *persistenceStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        
        NSError* error = nil;
        
        if (![persistenceStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:storeURL
                                                             options:nil
                                                               error:&error]) {
            
            @throw [NSException
                    exceptionWithName:@"OpenFailure"
                    reason:[error localizedDescription]
                    userInfo:nil];
        }
        
        self.context = [[NSManagedObjectContext alloc] init];
        self.context.persistentStoreCoordinator = persistenceStoreCoordinator;
        
        [self loadAllItems];
    }
    
    return self;
    
}

-(void)loadAllItems{
    
    
    if (!self.privateItems) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"TMBItem" inManagedObjectContext:self.context];
        
        request.entity = entity;
        
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        
        request.sortDescriptors = @[sortDescriptor];
        
        NSError* error;
        NSArray* result = [self.context executeFetchRequest:request error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        self.privateItems = [[NSMutableArray alloc] initWithArray:result];
        
    }
    
    
}

-(BOOL)saveChanges{
    
    NSError* error;
    BOOL sucessful = [self.context save:&error];
    NSLog(@"%@",self.allItems);
    if (!sucessful) {
        NSLog(@"Error saving: %@",[error localizedDescription]);
    }
    
    return sucessful;
}

@end
