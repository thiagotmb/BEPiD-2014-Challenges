//
//  GameScene.h
//  Space Scape
//

//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Player.h"
#import "Enemy.h"
#import "BackgroundLayer.h"
#import "GameState.h"
#import "Label.h"
@interface GameScene : SKScene<SKPhysicsContactDelegate>

@property (nonatomic) Player* player;

@property (nonatomic) BackgroundLayer* backgroundLayer;

@property (nonatomic) Label* scoreLabel;


@end
