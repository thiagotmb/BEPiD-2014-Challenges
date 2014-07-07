//
//  TMBViewController.h
//  Desafio06302014_Delegate
//
//  Created by Thiago Bernardes on 6/30/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBViewController : UIViewController<UIScrollViewDelegate,UIAlertViewDelegate>

@property (nonatomic) CGRect fullScreenRect;
@property (nonatomic, strong) IBOutlet UIView *backgroundView;

@property (nonatomic, strong) IBOutlet UIScrollView *upScroll;
@property (nonatomic) CGFloat upScrollContentSizeWidth;

@property (nonatomic, strong) IBOutlet UIScrollView *downScroll;
@property (nonatomic) CGFloat downScrollContentSizeWidth;

@property (nonatomic) unsigned int draggedScrol;


-(void)scrollViewResize;
-(void)setupView;
-(void)setupScrolls;
-(void)setupButtons;

@end
