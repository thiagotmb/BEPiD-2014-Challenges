//
//  TMBView.h
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_Paint
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBLine.h"

@interface TMBView : UIView

@property (nonatomic) NSMutableDictionary* linesInRender;
@property (nonatomic) NSMutableArray* renderedLines;

//@property (nonatomic) NSUserDefaults* userDefaults;
@property (nonatomic) NSString* appFileFolder;

@property (nonatomic) TMBLine *selectedLine;

-(void)setUpDatabase;
-(void)saveData;
-(UIColor*)drawColor:(TMBLine*)line;

@end
