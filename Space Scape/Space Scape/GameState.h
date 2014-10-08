//
//  GameState.h
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

@property (nonatomic,readonly) NSUInteger score;
@property (nonatomic) NSUInteger highScore;

+(GameState*)sharedState;

-(void)addScore:(NSUInteger)score;
-(void)resetScore;
-(void)saveState;


@end
