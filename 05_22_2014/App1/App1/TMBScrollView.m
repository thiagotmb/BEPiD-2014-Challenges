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
        _numberOfPages = 15;
        
        
            //seta o tamanho do conteudo da scrollview
            self.contentSize = CGSizeMake(self.frame.size.width * _numberOfPages,
                                          self.frame.size.height);
        

        
        [self addViews]; 
            //scroll comeca na pagina 5
            CGPoint scrollPoint = CGPointMake(self.frame.size.width * 15, 0);
            [self setContentOffset:scrollPoint animated:YES];
        
    }
    return self;
}


-(void)addViews
{
    for(int i = 1; i <= _numberOfPages ; i++){
    //cria a subview e aloca.
        TMBView *myView = [[TMBView alloc] initWithFrame:CGRectMake(self.frame.size.width*i, 0,self.frame.size.width, self.frame.size.height)];
        
        //adiciona uma subview no scrolview
        [self addSubview:myView];
        
        UIImage *photo = [UIImage imageNamed:[NSString stringWithFormat:@"photo%d.png",i]];
        
        [myView addData:[NSString stringWithFormat:@"Pessoa numero %d",i] withAge:i andPhoto:photo];
    
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
