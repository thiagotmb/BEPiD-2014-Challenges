//
//  TMBView.h
//  App3
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBView : UIView

@property (nonatomic,strong,readwrite) UITextView *textViewMorning;

@property (nonatomic,strong,readwrite) UITextView *textViewAfternoon;

@property (nonatomic,strong,readwrite) UITextView *textViewNight;


-(void)generateView;

-(void)generateDateLabel;

-(UITextView*)generateTextView:(CGSize)containerSize withSize:(CGRect)textViewSize;

@property (nonatomic) int dateRange;


@end
