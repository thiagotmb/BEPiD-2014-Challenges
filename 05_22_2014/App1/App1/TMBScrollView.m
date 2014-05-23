//
//  TMBScrollView.m
//  App1
//
//  Created by Thiago on 5/22/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBScrollView.h"

@implementation TMBScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pagingEnabled = YES;
        

            //seta o tamanho do conteudo da scrollview
            self.contentSize = CGSizeMake(self.frame.size.width * 14,
                                          self.frame.size.height);
            //scroll comeca na pagina 5
            CGPoint scrollPoint = CGPointMake(0, 0);
            [self setContentOffset:scrollPoint animated:YES];
        
        for(int i = 15; i>0 ; i--)
        {
            //cria a subview e aloca.
            TMBView *myView = [[TMBView alloc] initWithFrame:CGRectMake(self.frame.size.width*(i-1), 0,self.frame.size.width, self.frame.size.height)];
            
            
            //adiciona uma subview no scrolview
            [myView addViews:i];
            
            [self addSubview:myView];
        }
        
    }
    return self;
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
