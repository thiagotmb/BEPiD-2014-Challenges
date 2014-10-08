//
//  ClientModel.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "ClientModel.h"
#import "AppDelegate.h"
#import "Client.h"

@interface ClientModel ()

@property (nonatomic) NSMutableArray *privateClients;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation ClientModel

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ClientModel sharedModel]"
                                 userInfo:nil];
    return nil;
}

+ (instancetype)sharedModel
{
    static ClientModel *sharedModel = nil;
    
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
        
        [self loadAllClients];
    }
    return self;
}

- (Client *)createClient
{
    
    Client* newClient = [[Client alloc] init];
    
    return  newClient;
//#error Criar um cliente com todos os dados em branco e retorna-lo
}

- (void)loadAllClients
{
    
    NSEntityDescription *entityDescription = [NSEntityDescription  entityForName:@"Client" inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    self.privateClients = (NSMutableArray*)[self.context executeFetchRequest:request error:&error];
    
    if (error) {
        [NSException exceptionWithName:@"Failed to load all clients" reason:[error description] userInfo:nil];
        
    }
    
//#error Carregar todos os clientes do banco e salva-los no privateClients.
}

- (NSArray *)allClients
{
    return [NSArray arrayWithArray:self.privateClients];
}

@end