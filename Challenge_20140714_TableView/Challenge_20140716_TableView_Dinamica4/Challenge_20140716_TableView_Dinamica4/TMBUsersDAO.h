//
//  TMBUsersDAO.h
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "TMBUsersList.h"

@interface TMBUsersDAO : NSObject{
    
    sqlite3 *db;
}

-(NSMutableArray*) getUsers;

@end
