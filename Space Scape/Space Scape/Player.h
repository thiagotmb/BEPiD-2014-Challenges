//
//  Player.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Bullet.h"
@interface Player : SKSpriteNode

-(instancetype)initWithPosition:(CGPoint)position;
-(void)destroyPlayer;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end
