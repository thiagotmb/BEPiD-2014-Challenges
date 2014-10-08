//
//  BarndModel.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "BrandModel.h"
#import "AppDelegate.h"
#import "Brand.h"

@interface BrandModel ()

@property (nonatomic) NSMutableArray *privateBrands;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation BrandModel

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BrandModel sharedModel]"
                                 userInfo:nil];
    return nil;
}

+ (instancetype)sharedModel
{
    static BrandModel *sharedModel = nil;
    
    if (!sharedModel) {
        sharedModel = [[self alloc] initPrivate];
    }
    
    return sharedModel;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _context = appDelegate.managedObjectContext;
        
        [self loadAllBrands];
    }
    return self;
}

- (Brand *)createBrand
{
    Brand *newBrand = [[Brand alloc] init];
    return newBrand;
    
//#error Criar uma marca com todos os dados em branco e retorna-la
}

- (void)loadAllBrands
{
    NSEntityDescription *entityDescription = [NSEntityDescription  entityForName:@"Brand" inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    self.privateBrands = (NSMutableArray*)[self.context executeFetchRequest:request error:&error];
    
    if (error) {
        [NSException exceptionWithName:@"Failed to load brands" reason:[error description] userInfo:nil];
        
    }
    
//#error Carregar todas as marcas do banco e salva-las no privateBrands.
}

- (NSArray *)allBrands
{
    return [NSArray arrayWithArray:self.privateBrands];
}

@end
