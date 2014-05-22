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
        
        
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 10;
        self.layer.shadowOffset = CGSizeMake(-2, 7);
        

        
        self.backgroundColor = [UIColor whiteColor];
        
        

        
        

        
    }
    return self;
}

-(void)addPhoto:(UIImage *)photo
{
    
    //image view instance to display the image
    self.myImageView = [[UIImageView alloc] initWithImage:photo];
    
    //set the frame for the image view
    CGRect myFrame = CGRectMake(self.myImageView.frame.origin.x, self.myImageView.frame.origin.y, self.frame.size.width,
                                self.frame.size.height);
    [self.myImageView setFrame:myFrame];
    
    //If your image is bigger than the frame then you can scale it
    [self.myImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    //add the image view to the current view
    [self addSubview:self.myImageView];

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
