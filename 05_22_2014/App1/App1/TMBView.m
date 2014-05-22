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

-(void)addData:(NSString *)name withAge:(unsigned int)age andPhoto:(UIImage *)photo
{
    //create a label with name
    CGRect nameFrame = CGRectMake(self.frame.size.width/15, self.frame.size.height/2, 300, 50);
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameFrame];
    nameLabel.text = [NSString stringWithFormat:@"Nome: %@", name];
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:nameLabel];
    
    //create a label with age
    CGRect ageFrame = CGRectMake(self.frame.size.width/15, self.frame.size.height/1.75, 300, 50);
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:ageFrame];
    ageLabel.text = [NSString stringWithFormat:@"Idade: %d", age];
    ageLabel.font = [UIFont systemFontOfSize:20];
    ageLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:ageLabel];
    
    //create a square with image
    CGRect photoFrame = CGRectMake(self.frame.size.width/8, self.frame.size.height/8, self.frame.size.width - (2*self.frame.size.width/8) , self.frame.size.height/2 - 75);
    TMBPhotoView *photoView = [[TMBPhotoView alloc] initWithFrame:photoFrame];    
    [photoView addPhoto:photo];    
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
