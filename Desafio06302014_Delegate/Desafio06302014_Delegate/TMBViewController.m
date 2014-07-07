//
//  TMBViewController.m
//  Desafio06302014_Delegate
//
//  Created by Thiago Bernardes on 6/30/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"

static const int  scrollResizeFactor = 150;

@interface TMBViewController ()

@end

@implementation TMBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
    [self setupScrolls];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView{
    
     _fullScreenRect=[[UIScreen mainScreen] applicationFrame];

    _backgroundView = [[UIView alloc] initWithFrame:_fullScreenRect];
    _backgroundView.backgroundColor = [UIColor redColor];
    
    [self setView:_backgroundView];
    
}

-(void)setupScrolls{
    
    
    
    _upScroll=[[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, _fullScreenRect.size.width -20 , _fullScreenRect.size.height/2 - 10)];
    _upScrollContentSizeWidth = 0;
    _upScroll.contentSize = CGSizeMake(_upScrollContentSizeWidth , _fullScreenRect.size.height/2 - 20);
    _upScroll.backgroundColor = [UIColor grayColor];
    
    
    _downScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, _fullScreenRect.size.height/2 + 10 , _fullScreenRect.size.width - 20, _fullScreenRect.size.height/2 -10 )];
    _downScrollContentSizeWidth = 0;
    _downScroll.contentSize = CGSizeMake(_downScrollContentSizeWidth , _fullScreenRect.size.height/2 -20);
    _downScroll.backgroundColor = [UIColor whiteColor];
    
    
    _downScroll.delegate = self;
    _upScroll.delegate = self;
    
    
    
    
    [_backgroundView addSubview:_upScroll];
    [_backgroundView addSubview:_downScroll];
    
    [self setupButtons];

}

-(void)setupButtons{
    
    for (int i = 0; i < 6; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(_downScrollContentSizeWidth, 10, _fullScreenRect.size.width/4, _fullScreenRect.size.height/6)];
        [button setTitle:[NSString stringWithFormat:@"Button %d", i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blackColor]];
        
        _downScrollContentSizeWidth += button.frame.size.width + 10;
        [_downScroll addSubview:button];
        [_downScroll setContentSize:CGSizeMake(_downScrollContentSizeWidth,  _fullScreenRect.size.height/2) ];
        
    }
    
    for (int i = 6; i > 0; i--) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(_upScrollContentSizeWidth, 10, _fullScreenRect.size.width/4, _fullScreenRect.size.height/6)];
        [button setTitle:[NSString stringWithFormat:@"Button %d", i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor purpleColor]];
        
        _upScrollContentSizeWidth += button.frame.size.width + 10;
        [_upScroll addSubview:button];
        [_upScroll setContentSize:CGSizeMake(_upScrollContentSizeWidth, 0) ];
        
    }
    
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    NSString* scrollViewDragged;
    NSString* resizeString;

    
    if(scrollView == _upScroll){
        
        NSLog(@"Up scroll ends dragging");
        
        _draggedScrol = 1;
        scrollViewDragged = @"SUPERIOR";

        if(_upScroll.frame.size.height < _fullScreenRect.size.height/2)
            resizeString =@"AUMENTAR!";
        else
            resizeString =@"DIMINUIR!";
    }
    
    if(scrollView == _downScroll){
        
        NSLog(@"down scroll ends dragging");
        
        _draggedScrol = 2;
        scrollViewDragged = @"INFERIOR";

        if(_downScroll.frame.size.height < _fullScreenRect.size.height/2)
            resizeString =@"AUMENTAR!";
        else
            resizeString =@"DIMINUIR!";
    }

    
    NSString *title = [NSString stringWithFormat:@"Scroll View %@",scrollViewDragged];
    NSString *buttonTitle = [NSString stringWithFormat:@"%@",resizeString];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"Voce pode redimenciona-la" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:buttonTitle, nil];

    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex==1)
        [self scrollViewResize];
    
    if (buttonIndex==2)
        [self scrollViewResize];
        

    
    
}

-(void)scrollViewResize{
    
    if(_draggedScrol == 2){
        
        if(_downScroll.frame.size.height < _fullScreenRect.size.height/2){
            NSLog(@"aumentar");

            [_upScroll setFrame:CGRectMake(_upScroll.frame.origin.x, _upScroll.frame.origin.y ,_upScroll.frame.size.width, _upScroll.frame.size.height - scrollResizeFactor)];
            
            [_downScroll setFrame:CGRectMake(_downScroll.frame.origin.x, _downScroll.frame.origin.y - scrollResizeFactor , _downScroll.frame.size.width, _downScroll.frame.size.height + scrollResizeFactor )];
        }else{
            
            NSLog(@"diminuir");
            [_upScroll setFrame:CGRectMake(_upScroll.frame.origin.x, _upScroll.frame.origin.y ,_upScroll.frame.size.width, _upScroll.frame.size.height + scrollResizeFactor)];
            
            [_downScroll setFrame:CGRectMake(_downScroll.frame.origin.x, _downScroll.frame.origin.y + scrollResizeFactor , _downScroll.frame.size.width, _downScroll.frame.size.height - scrollResizeFactor )];
            
        }
        
    }else if(_draggedScrol == 1){
        
        if(_upScroll.frame.size.height < _fullScreenRect.size.height/2){
        
        [_downScroll setFrame:CGRectMake(_downScroll.frame.origin.x, _downScroll.frame.origin.y + scrollResizeFactor ,_downScroll.frame.size.width, _downScroll.frame.size.height - scrollResizeFactor)];
        
        [_upScroll setFrame:CGRectMake(_upScroll.frame.origin.x, _upScroll.frame.origin.y , _upScroll.frame.size.width, _upScroll.frame.size.height + scrollResizeFactor )];
        }else{
            
            [_downScroll setFrame:CGRectMake(_downScroll.frame.origin.x, _downScroll.frame.origin.y - scrollResizeFactor ,_downScroll.frame.size.width, _downScroll.frame.size.height + scrollResizeFactor)];
            
            [_upScroll setFrame:CGRectMake(_upScroll.frame.origin.x, _upScroll.frame.origin.y , _upScroll.frame.size.width, _upScroll.frame.size.height - scrollResizeFactor )];
        }
        
    }else
        NSLog(@"Nothing scroll view dragged");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
