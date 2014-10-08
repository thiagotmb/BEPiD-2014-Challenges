//
//  BackgroundLayer.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BackgroundLayer : SKNode

@property (nonatomic) SKEmitterNode *layer1;
@property (nonatomic) SKEmitterNode *layer2;

-(instancetype)initWithSize:(CGSize)size;

@end
