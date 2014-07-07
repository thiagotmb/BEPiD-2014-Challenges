//
//  TMBScrollView.m
//  App3
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "TMBScrollView.h"


@implementation TMBScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _numberOfViews = 6;
        [self setContentSize:CGSizeMake(self.frame.size.width*_numberOfViews, self.frame.size.height)];
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
        [self setPagingEnabled:YES];
        
        
        
        [self addDailyView];
        
        
    }
    return self;
}

-(void)addDailyView
{
    for (int i = 1 ; i <= _numberOfViews  ; i++)
    {
        
        CGRect frame = CGRectMake(self.frame.size.width*(i-1), self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    TMBView *dailyView = [[TMBView alloc] initWithFrame:frame];
    _mainView = dailyView;
    _mainView.dateRange = i;
    [_mainView generateView];
        
    [self addSubview:_mainView];
    }
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
