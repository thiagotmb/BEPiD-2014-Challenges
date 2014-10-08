//
//  Player.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "Player.h"
#import "PhysicsCategories.h"

@implementation Player

-(instancetype)initWithPosition:(CGPoint)position{
    
    self = [super initWithImageNamed:@"player"];
    
    if (self) {
        self.position = position;
        [self startShooting];
        [self configurePhysicsBody];
    }
    
    return self;
}

-(void)destroyPlayer{
    
    [self removeFromParent];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    

    
    UITouch* touch = [touches anyObject];
    CGPoint lastLocation = [touch previousLocationInNode:self.parent];
    CGPoint touchLocation = [touch locationInNode:self.parent];
    
    CGPoint difference = CGPointMake(touchLocation.x - lastLocation.x, touchLocation.y - lastLocation.y);
    
    
    
    self.position = CGPointMake(self.position.x + difference.x, self.position.y + difference.y);
    
}

-(void)startShooting {
 
    SKAction *shoot = [SKAction runBlock:^{
        
        [self shootAtAngle:90 andSpeed:150];
    }];
    
    SKAction *delay = [SKAction waitForDuration:0.5];
    SKAction *sequence = [SKAction sequence:@[shoot,delay]];
    
    [self runAction:[SKAction repeatActionForever:sequence]];
    
}

-(void)shootAtAngle:(float)angleDregrees andSpeed:(float)speed{
    
    Bullet *bullet = [[Bullet alloc] initWithPosition:self.position bulletSpeed:speed angle:angleDregrees andImageNamed:@"tiro_player"];
    [self.parent addChild:bullet];

    
    SKAction *remove = [SKAction runBlock:^{
        
        [bullet removeFromParent];
        
    }];
    
    bullet.physicsBody.categoryBitMask = ColliderTypeBulletPlayer;
    
    SKAction *delay = [SKAction waitForDuration:10];
    SKAction *sequence = [SKAction sequence:@[delay,remove]];
    
    [self runAction:sequence];
}

-(void)configurePhysicsBody{
    
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    self.physicsBody.categoryBitMask = ColliderTypePlayer;
    self.physicsBody.contactTestBitMask = ColliderTypeEnemy | ColliderTypeBulletEnemy;
    self.physicsBody.collisionBitMask = 0;
}

@end
