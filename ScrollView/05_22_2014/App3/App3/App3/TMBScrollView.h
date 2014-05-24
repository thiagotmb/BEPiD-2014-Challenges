//
//  TMBScrollView.h
//  App3
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBView.h"

@interface TMBScrollView : UIScrollView

@property (nonatomic) unsigned int numberOfViews;

@property (nonatomic) TMBView *mainView;

-(void)addDailyView;


@end
