//
//  TMBScrollView.m
//  ScrollViewChallenge
//
//  Created by Thiago on 5/21/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBScrollView.h"

@implementation TMBScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myScrollView = [[UIScrollView alloc]
                            initWithFrame:CGRectMake(0, 0,
                                                     self.frame.size.width,
                                                     self.frame.size.height)];
        self.myScrollView.pagingEnabled = YES;
        
        
        //Cria 10 views e adiciona no scroll
        NSInteger numberOfViews = 10;
        for (int i = 0; i < numberOfViews; i++) {
            
            //seta a origem da subview
            CGFloat myOrigin = i * self.frame.size.width;
            
            //cria a subview e aloca.
            UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(myOrigin, 0,self.frame.size.width, self.frame.size.height)];
            //seta a cor do background da subview
            myView.backgroundColor = [UIColor whiteColor];
            
            //cria uma label com o numero da view
            CGRect myFrame = CGRectMake(20.0f, 10.0f, 200.0f, 25.0f);
            UILabel *myLabel = [[UILabel alloc] initWithFrame:myFrame];
            myLabel.text = [NSString stringWithFormat:@"Pagina de numero %d", i];
            myLabel.font = [UIFont boldSystemFontOfSize:16.0f];
            myLabel.textAlignment =  NSTextAlignmentLeft;
            [myView addSubview:myLabel];
            
        
            //adiciona uma subview no scrolview
            [self.myScrollView addSubview:myView];
            
            //seta o tamanho do conteudo da scrollview
            self.myScrollView.contentSize = CGSizeMake(self.frame.size.width * numberOfViews,
                                                       self.frame.size.height);
            
            //scroll comeca na pagina 5
            CGPoint scrollPoint = CGPointMake(self.frame.size.width * 5, 0);
            [_myScrollView setContentOffset:scrollPoint animated:YES];
            
            [self addSubview:self.myScrollView];
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
