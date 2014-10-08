//
//  Bullet.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

-(instancetype)initWithPosition:(CGPoint)position bulletSpeed:(float)speed angle:(float)angleDegrees andImageNamed:(NSString *)imageName{
    
    self = [self initWithImageNamed:imageName];
    
    if (self) {
        float radians = angleDegrees/180*M_PI;
        
        self.position = position;
        self.bulletSpeed = speed;
        self.zRotation = radians;

        [self startMoving];
        [self configurePhysicsBody];
    }
    
    return self;
    
}

-(void)startMoving{
    
    CGVector movement = CGVectorMake(cosf(self.zRotation)*self.bulletSpeed,sinf(self.zRotation)*self.bulletSpeed);
    
    SKAction *move = [SKAction moveBy:movement duration:1];

    
    [self runAction:[SKAction repeatActionForever:move]];
    
}

-(void)configurePhysicsBody{
    
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    self.physicsBody.collisionBitMask = 0;
}

-(void)destroyBullet{
    
    [self removeFromParent];
}

@end
