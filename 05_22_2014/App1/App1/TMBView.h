//
//  TMBView.h
//  App1
//
//  Created by Thiago on 5/22/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBPhotoView.h"


@interface TMBView : UIView

-(void)addData:(NSString*)name withAge:(unsigned int)age andPhoto:(UIImage*)photo;

@end
