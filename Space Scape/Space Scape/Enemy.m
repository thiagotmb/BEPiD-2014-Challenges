//
//  Enemy.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/6/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "Enemy.h"
#import "PhysicsCategories.h"
static int speedY = -60;

@implementation Enemy{
    
    int speedX;
}



-(instancetype)initWithPosition:(CGPoint)position{
    
    self = [super initWithImageNamed:@"inimigo1"];
    
    if (self) {
        self.position = position;
        speedX =1;
        [self startMoving];
        [self startShooting];
        [self selfDestructWithDealy:25];
        [self configurePhysicsBody];
        
    }
    
    return self;
}

-(void)startMoving{

    CGVector movmentY = CGVectorMake(sinf(self.zRotation)*speedY, cosf(self.zRotation)*speedY);
    SKAction *moveY = [SKAction moveBy:movmentY duration:1];
    [self runAction:[SKAction repeatActionForever:moveY]];

   /* SKAction* changePosition = [SKAction runBlock:^{
  
        if (self.position.x > self.scene.size.width) {
            
            speedX = self.scene.position.x;

        }else if(self.position.x < self.scene.position.x){
            
            speedX = self.scene.size.width;

        }
        
    }];
  */
   // SKAction* moveX = [SKAction moveToX:speedX duration:1];
    
   //[self runAction:[SKAction repeatActionForever:[SKAction sequence:@[changePosition,moveX]]]];
}


-(void)startShooting{
    
    SKAction *shoot = [SKAction runBlock:^{
        
        [self shootAtAngle:-90 andSpeed:180];
    }];
    
    SKAction *delay = [SKAction waitForDuration:1.5];
    
    SKAction* sequence = [SKAction sequence:@[shoot,delay]];
    
    [self runAction:[SKAction repeatActionForever:sequence]];
    
    
}
                       
-(void)shootAtAngle:(float)angleDegrees andSpeed:(float)speed{
                           
    Bullet *bullet = [[Bullet alloc] initWithPosition:self.position bulletSpeed:speed angle:angleDegrees andImageNamed:@"tiro_inimigo"];
    [self.parent addChild:bullet];
    
    
    SKAction *remove = [SKAction runBlock:^{
        
        [bullet removeFromParent];
        
    }];
    
    bullet.physicsBody.categoryBitMask = ColliderTypeBulletEnemy;

    
    SKAction *delay = [SKAction waitForDuration:10];
    SKAction *sequence = [SKAction sequence:@[delay,remove]];
    
    
    [self runAction:sequence];
    
    
}


-(void)selfDestructWithDealy:(NSTimeInterval)delay{
    
    SKAction* delayAction = [SKAction waitForDuration:delay];
    
    SKAction* destroyAction = [SKAction runBlock:^{
       
        [self removeFromParent];
        
    }];
    
    SKAction* sequence = [SKAction sequence:@[delayAction,destroyAction]];
    
    [self runAction:sequence];
    
}

                       
-(void)destroyEnemy{
    
    [self removeFromParent];
    
}

-(SKAction *)moveHorizontally{
    
    return nil;
    
}

-(void)configurePhysicsBody{
    
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    self.physicsBody.categoryBitMask = ColliderTypeEnemy;
    self.physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeBulletPlayer;
    self.physicsBody.collisionBitMask = 0;
}

+(SKTexture *)generateTexture{
    
    return nil;
}



@end
