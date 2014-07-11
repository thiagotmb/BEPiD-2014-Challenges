//
//  TMBPageViewController.m
//  Challenge_20140707_NavigationController_2
//
//  Created by Thiago Bernardes on 7/10/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPageViewController.h"

#define PagesCount 6

@interface TMBPageViewController ()

@end

@implementation TMBPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(TMBNavigationController*)viewControllerAtIndex:(NSUInteger)index{
    
    TMBNavigationController *childViewController = [[TMBNavigationController alloc] init];
    childViewController.pageIndex = index;
    
    return childViewController;
    
}
-(void)setUpPageController{
    
    _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    _pageController.dataSource = self;
    [_pageController.view setFrame:self.view.bounds];
    
    TMBNavigationController *firstPage = [self viewControllerAtIndex:0];
    
    
    NSArray *viewControllers = [NSArray arrayWithObject:firstPage];
    
    [_pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:_pageController];
    [self.view addSubview:_pageController.view];
    [_pageController didMoveToParentViewController:self];
    
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    _index = [(TMBNavigationController *)viewController pageIndex];
    
    if(_index!=0){
        _index--;
        return [self viewControllerAtIndex:_index];
    }else{
        return nil;
    }
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    _index = [(TMBNavigationController *)viewController pageIndex];
    
    if(_index<PagesCount-1){
        _index++;
        return [self viewControllerAtIndex:_index];
    }else{
        
        return nil;
    }
    
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    
    return PagesCount;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    
    return 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpPageController];
        
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
