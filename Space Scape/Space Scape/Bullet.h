//
//  Bullet.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bullet : SKSpriteNode

-(instancetype) initWithPosition:(CGPoint)position bulletSpeed:(float)speed angle:(float)angleDegrees andImageNamed:(NSString*)imageName;
-(void)destroyBullet;

@property(nonatomic) float bulletSpeed;

@end
