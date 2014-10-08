//
//  Label.m
//  Space Scape
//
//  Created by Thiago-Bernardes on 10/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "Label.h"
#import "GameState.h"
@implementation Label


-(instancetype)initWithFontNamed:(NSString *)fontName{
    
    self = [super initWithFontNamed:fontName];
    
    if (self) {
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        self.verticalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        
    }
    
    return self;
}

-(void)update{
    
    self.text = [NSString stringWithFormat:@"%lu",(unsigned long)[GameState sharedState].score];
    
}

@end
