//
//  PhysicsCategories.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/6/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#ifndef Space_Scape_PhysicsCategories_h
#define Space_Scape_PhysicsCategories_h


typedef NS_ENUM(NSUInteger, ColliderType){
    
    ColliderTypePlayer = 1 << 0,
    ColliderTypeEnemy = 1 << 1,
    ColliderTypeBulletPlayer = 1 << 2,
    ColliderTypeBulletEnemy = 1 << 3
    
};

#endif
