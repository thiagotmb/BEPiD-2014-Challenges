//
//  Enemy.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/6/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Bullet.h"

@interface Enemy : SKSpriteNode

+(SKTexture*)generateTexture;
-(instancetype)initWithPosition:(CGPoint)position;
-(SKAction*)moveHorizontally;
-(void)destroyEnemy;



@end
