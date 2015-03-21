//
//  TMBView.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_DemoTouch
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBView.h"

@implementation TMBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *t = [touches anyObject];
    
    CGPoint point = [t locationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:point];
    NSLog(@"%@",value);

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *t = [touches anyObject];
    
    CGPoint point = [t locationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:point];
    NSLog(@"%@",value);
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
