//
//  GameState.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "GameState.h"

static GameState *gameState;

@implementation GameState

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"SingletonException" reason:@"Cannot instantiate singleton" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _score = 0;
        self.highScore = 0;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        id highScore = [defaults objectForKey:@"highScore"];
        if (highScore) {
        self.highScore = [highScore integerValue];
        }
        
    }
    return self;
}


+(GameState*)sharedState{
    static dispatch_once_t token;
    
    dispatch_once(&token,^{
        
        gameState = [[GameState alloc] initPrivate];
    });
    
    return gameState;
    
    
}

-(void)addScore:(NSUInteger)score{
    
    _score += score;
    
}

-(void)resetScore{
    
    _score = 0;
}

-(void)saveState{
    
    _highScore = MAX(_score, _highScore);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSNumber numberWithUnsignedInteger:_highScore] forKey:@"highScore"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

@end
