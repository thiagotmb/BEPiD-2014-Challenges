//
//  TMBView.m
//  App1
//
//  Created by Thiago on 5/22/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBView.h"

@implementation TMBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //seta a cor do background da subview
        self.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}
-(void)addViews:(int)photoNumber
{
    //cria uma label com o nome
    CGRect nameFrame = CGRectMake(self.frame.size.width/15, self.frame.size.height/2, 300, 50);
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameFrame];
    nameLabel.text = [NSString stringWithFormat:@"Nome: %d", photoNumber];
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:nameLabel];
    
    //cria uma label com a idade
    CGRect ageFrame = CGRectMake(self.frame.size.width/15, self.frame.size.height/1.75, 300, 50);
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:ageFrame];
    ageLabel.text = [NSString stringWithFormat:@"Idade: %d", photoNumber];
    ageLabel.font = [UIFont systemFontOfSize:20];
    ageLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:ageLabel];
    
    
    //cria um quadrado com a imagem
    CGRect photoFrame = CGRectMake(self.frame.size.width/5, self.frame.size.height/8, self.frame.size.width - (2*self.frame.size.width/5) , self.frame.size.height/2 - 75);
    
    TMBPhotoView *photoView = [[TMBPhotoView alloc] initWithFrame:photoFrame];
    [photoView addPhotoView:photoNumber];
    NSLog(@"view photo number %d",photoNumber);
    
    [self addSubview:photoView];
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
