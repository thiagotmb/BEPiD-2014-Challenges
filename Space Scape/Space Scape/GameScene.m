//
//  GameScene.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "GameScene.h"
#import "PhysicsCategories.h"


@interface GameScene ()

@property(nonatomic) SKNode *world;
@property(nonatomic) SKNode *hudLayer;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view{
    
    self.world = [SKNode node];
    self.hudLayer = [SKNode node];
    
    self.player = [[Player alloc] initWithPosition:CGPointMake(self.size.width/2, self.size.height/4)];
    
    [self.world addChild:self.player];
    [self enemyGenerator];
    
    [self addChild:self.world];
    
    [self setupPhysics];
    [self createBackground];
    [self createHud];
}




-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    [self.player touchesMoved:touches withEvent:event];

}

-(void)bindPlayerPosition{
    
    
    if (self.player.position.x > self.scene.size.width) {
        
        CGPoint sceneLimit = CGPointMake(self.scene.size.width, self.player.position.y);
        [self.player setPosition:sceneLimit];
        
    }else if(self.player.position.x < self.scene.position.x){
        
        CGPoint sceneLimit = CGPointMake(self.scene.position.x, self.player.position.y);
        [self.player setPosition:sceneLimit];
        
    }
    
    
    if (self.player.position.y > self.scene.size.height) {
        
        CGPoint sceneLimit = CGPointMake(self.player.position.x, self.scene.size.height);
        [self.player setPosition:sceneLimit];
        
    }else if(self.player.position.y < self.scene.position.y){
        
        CGPoint sceneLimit = CGPointMake(self.player.position.x, self.scene.position.y);
        [self.player setPosition:sceneLimit];
        
    }

    
}

-(void)enemyGenerator{
    
    SKAction *callEnemies = [SKAction performSelector:@selector(callEnemies) onTarget:self];
    SKAction *delay = [SKAction waitForDuration:1 withRange:0];
    SKAction *sequence = [SKAction sequence:@[delay,callEnemies]];
    SKAction* enemyGenerator = [SKAction repeatActionForever:sequence];
    
    [self runAction:enemyGenerator];
    
}

-(void)callEnemies{
    
    Enemy *enemy = [[Enemy alloc] initWithPosition:[self randomizePosition]];
    [self.world addChild:enemy];
    
}

-(CGPoint) randomizePosition{
    float screenSizeWidth = self.size.width;
    float screenSizeHeight = self.scene.size.height * 1.1;
    int randomWidthPosition = 1 + arc4random() % ((int)screenSizeWidth -1);
    int randomHeightPosition = (int)self.size.height + arc4random() % ((int)screenSizeHeight - (int)self.size.height);
    
    CGPoint position = CGPointMake(randomWidthPosition, randomHeightPosition);
    
    return position;
}

-(void)setupPhysics{
    
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    uint32_t collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask;
    
    if (collision == (ColliderTypePlayer | ColliderTypeEnemy)) {
        Player *player;
        Enemy *enemy;
        
        if ([contact.bodyA.node isKindOfClass:[Player class]]) {
            player = (Player*)contact.bodyA.node;
            enemy = (Enemy*)contact.bodyB.node;
            
        }else{
            
            player = (Player*)contact.bodyB.node;
            enemy = (Enemy*)contact.bodyA.node;
        }
        
        
        [player destroyPlayer];
        [enemy destroyEnemy];
        [self gameOver];
        
    }else  if (collision == (ColliderTypePlayer | ColliderTypeBulletEnemy)) {
        Player *player;
        Bullet *bullet;
        
        if ([contact.bodyA.node isKindOfClass:[Player class]]) {
            player = (Player*)contact.bodyA.node;
            bullet = (Bullet*)contact.bodyB.node;
            
        }else{
            
            player = (Player*)contact.bodyB.node;
            bullet = (Bullet*)contact.bodyA.node;
        }
        
        
        [player destroyPlayer];
        [bullet destroyBullet];
        [self gameOver];
        
    }else if (collision == (ColliderTypeEnemy | ColliderTypeBulletPlayer)) {
        Enemy *enemy;
        Bullet *bullet;
        
        if ([contact.bodyA.node isKindOfClass:[Enemy class]]) {
            enemy = (Enemy*)contact.bodyA.node;
            bullet = (Bullet*)contact.bodyB.node;
            
        }else{
            
            enemy = (Enemy*)contact.bodyB.node;
            bullet = (Bullet*)contact.bodyA.node;
        }
        
        [[GameState sharedState] addScore:1];
        [enemy destroyEnemy];
        [bullet destroyBullet];
        
    }


    
    
    
}

-(void)createBackground{
    
    self.backgroundLayer = [[BackgroundLayer alloc] initWithSize:self.size ];
    [self.world addChild:self.backgroundLayer];
    
}

-(void)createHud{
    
    self.scoreLabel = [[Label alloc] initWithFontNamed:@"Futura-CondensedExtraBold"];
    self.scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-50);
    
    [self.hudLayer addChild:self.scoreLabel];
    [self addChild:self.hudLayer];
    
}


-(void)gameOver{
    
    Label *highScoreLabel = [[Label alloc] initWithFontNamed:@"Futura-CondensedExtraBold"];
    highScoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-200);
    highScoreLabel.text = [NSString stringWithFormat:@"High Score: %lu",[[GameState sharedState] highScore]];
    
    [self.hudLayer addChild:highScoreLabel];
    
    Label *restart = [[Label alloc] initWithFontNamed:@"Futura-CondensedExtraBold"];
    restart.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-400);
    restart.text = @"Restart";
    [self.hudLayer addChild:restart];
    

}

-(void)update:(NSTimeInterval)currentTime{
    
    [self bindPlayerPosition];
    [self.scoreLabel update];
    
}

@end
