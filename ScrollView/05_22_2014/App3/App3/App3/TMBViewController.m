//
//  TMBViewController.m
//  App3
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "TMBViewController.h"

@interface TMBViewController ()

@end

@implementation TMBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        TMBScrollView *mainScrollView = [[TMBScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView = mainScrollView;
        [self.view addSubview:_mainScrollView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//methods below are to the screen move up keyboard
-(void)keyboardWillShow {
    // Animate the current view out of the way
    
    if (self.mainScrollView.mainView.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.mainScrollView.mainView.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.mainScrollView.mainView.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.mainScrollView.mainView.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextView *)sender
{
    if ([sender isEqual:self.mainScrollView.mainView.textViewNight])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.mainScrollView.mainView.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    _kOFFSET_FOR_KEYBOARD = (self.mainScrollView.mainView.textViewNight.bounds.size.height+(self.mainScrollView.mainView.textViewNight.bounds.size.height/3));
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.mainScrollView.mainView.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= _kOFFSET_FOR_KEYBOARD;
        rect.size.height += _kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += _kOFFSET_FOR_KEYBOARD;
        rect.size.height -= _kOFFSET_FOR_KEYBOARD;
    }
    self.mainScrollView.mainView.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
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
