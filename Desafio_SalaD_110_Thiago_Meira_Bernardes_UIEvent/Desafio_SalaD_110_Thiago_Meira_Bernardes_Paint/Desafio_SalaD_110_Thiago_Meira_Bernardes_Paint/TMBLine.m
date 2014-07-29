//
//  TMBLine.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_Paint
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBLine.h"

@implementation TMBLine

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.begin = CGPointFromString([NSString stringWithFormat:@"%@",[coder decodeObjectForKey:@"begin"]]);
        self.end = CGPointFromString([NSString stringWithFormat:@"%@",[coder decodeObjectForKey:@"end"]]);
        self.type = [[coder decodeObjectForKey:@"type"] intValue];
        self.lineWidth = [[coder decodeObjectForKey:@"lineWidth"] floatValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    NSValue *begin = [NSValue valueWithCGPoint:self.begin];
    NSValue *end = [NSValue valueWithCGPoint:self.end];

    [aCoder encodeObject:begin forKey:@"begin"];
    [aCoder encodeObject:end forKey:@"end"];
    [aCoder encodeObject:[NSString stringWithFormat:@"%ld",(long)self.type] forKey:@"type"];
    [aCoder encodeObject:[NSString stringWithFormat:@"%.f forKey:<#(NSString *)#>]
}


-(void)stroke{
    
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    
    currentPath.lineWidth  = _lineWidth;
    
    currentPath.lineCapStyle = kCGLineCapRound;
    
    [currentPath moveToPoint:self.begin];
    [currentPath addLineToPoint:self.end];
    [currentPath stroke];
    
}

-(BOOL)havePoint:(CGPoint)point{
    
    for(float t= 0.0; t<1.0; t+= 0.5){
        
        float x = self.begin.x + t*(self.end.x - self.begin.x);
        float y = self.begin.y + t*(self.end.y - self.begin.y);
        
        if(hypot(x - point.x, y -point.y) <20.0){
            
            return YES;
        }
        
    }
    return NO;
}

/*
 Param:nil
 Function: This method draw an circle with bezierpath
 Return:nil
 */
-(void)drawCircle{
    
    
    CGFloat dx = self.end.x - self.begin.x;
    CGFloat dy = self.end.y - self.begin.y;
    //Pitagoras
    float radius = sqrtf((dx*dx) + (dy*dy));
    
    CGPoint center = CGPointMake(self.begin.x+dx/2, self.begin.y+dy/2);

    UIBezierPath *firstHalf = [UIBezierPath bezierPath];
    [firstHalf addArcWithCenter:center radius:radius/2 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [firstHalf setLineWidth:1.0];
    [firstHalf stroke];
    

    UIBezierPath *secondHalf = [UIBezierPath bezierPath];
    [secondHalf addArcWithCenter:center radius:radius/2 startAngle:M_PI_2 endAngle:3.0 * M_PI_2 clockwise:YES];
    [secondHalf setLineWidth:1.0];
    [secondHalf stroke];
    
}

/*
 Param:(CGPoint)a = reference point of angle, (CGPoint)b = final point
 Function: This method calcules the angle in degrees between two points
 Return:float = angle between two points in degrees
 */
- (float) getAngleBetween:(CGPoint)a and:(CGPoint)b
{
    int x = a.x;
    int y = a.y;
    float dx = b.x - x;
    float dy = b.y - y;
    CGFloat radians = atan2(-dx,dy);        // in radians
    CGFloat degrees = radians * 180 / 3.14; // in degrees

    return degrees;
}




@end
