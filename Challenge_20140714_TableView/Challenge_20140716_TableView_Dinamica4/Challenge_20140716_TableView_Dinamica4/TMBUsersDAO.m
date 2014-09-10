//
//  TMBUsersDAO.m
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBUsersDAO.h"

@implementation TMBUsersDAO

-(NSMutableArray *)getUsers{
    
    NSMutableArray *usersArray = [[NSMutableArray alloc] init];
    
    @try{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"funcionarios.sqlite"];
        
    BOOL sucess = [fileManager fileExistsAtPath:dbPath];
    
    if (sucess) {
        
        if((sqlite3_open([dbPath UTF8String], &db)) == SQLITE_OK){
            
            const char *sqlProgram = "select idFuncionario, name, age, email, valorSalario, mes, ano, photo from Funcionarios inner join Salarios on funcionarios.id = salarios.idFuncionario WHERE mes = 1";
            sqlite3_stmt *sqlStatement;
            
            if (sqlite3_prepare(db, sqlProgram, -1, &sqlStatement, NULL) == SQLITE_OK) {
                
                while (sqlite3_step(sqlStatement)) {
                    TMBUsersList *currentUser = [[TMBUsersList alloc] init];
                    currentUser.userId = sqlite3_column_int(sqlStatement, 0);
                    currentUser.userName = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 1)];
                    currentUser.userAge = sqlite3_column_int(sqlStatement, 2);
                    currentUser.userEmail = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 3)];
                    currentUser.userSalary = sqlite3_column_double(sqlStatement, 4);
                    currentUser.salaryMonth = sqlite3_column_int(sqlStatement, 5);
                    currentUser.salaryYear = sqlite3_column_int(sqlStatement, 6);

                    
                    const char* raw = sqlite3_column_blob(sqlStatement,7);
                    int rawLength = sqlite3_column_bytes(sqlStatement, 7);
                    NSData *photoData = [NSData dataWithBytes:raw length:rawLength];
                    currentUser.userPhoto = [[UIImage alloc] initWithData:photoData];
                    [usersArray addObject:currentUser];
                }
                
            }else{
                
                NSLog(@"Can't prepare statement");
            }
            
        }else{
            
            NSLog(@"Database can't open");
        }
           
    }else{
        NSLog(@"Can't locate database file at path %@:",dbPath);
    }
    }
    @catch (NSException *exception){
        
        NSLog(@"Exception in get users: %@", [exception reason]);
    }
    @finally{
        return usersArray;
    }
    
}

@end
