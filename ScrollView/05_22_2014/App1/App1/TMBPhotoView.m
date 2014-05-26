//
//  TMBPhotoView.m
//  App1
//
//  Created by Thiago on 5/22/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import "TMBPhotoView.h"

@implementation TMBPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
   
        self.layer.masksToBounds = NO;
  
        
    }
    return self;
}

-(void)addPhotoView:(int)photoNumber
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"photo%d.png",photoNumber]]];
    
    [imgView setFrame:self.bounds];
    
    imgView.layer.shadowColor = [UIColor blackColor].CGColor;
    imgView.layer.shadowOpacity = 0.7f;
   // imgView.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    imgView.layer.shadowRadius = 2.0f;
    imgView.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:imgView.bounds];
    imgView.layer.shadowPath = path.CGPath;
    
    NSLog(@"photo photo number %d",photoNumber);
    
    [self addSubview:imgView];
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
