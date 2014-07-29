//
//  TMBLine.h
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_Paint
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface TMBLine : NSObject <NSCoding>

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic) NSInteger type;

enum StrokeType : NSUInteger{
    
    StrokeTypeLine = 0,
    StrokeTypeCircle = 1
    
};

-(void)stroke;
-(void)drawCircle;

-(float)getAngleBetween:(CGPoint)a and:(CGPoint)b;

-(BOOL)havePoint: (CGPoint)point;

@end
