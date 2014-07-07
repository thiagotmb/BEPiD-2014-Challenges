//
//  AddTabViewController.m
//  desafio25062014
//
//  Created by Thiago Bernardes on 6/25/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddTabViewController.h"

@interface AddTabViewController ()

@end

@implementation AddTabViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem.title = @"Tabs";
        UIImage *image2 = [UIImage imageNamed:@"fig1.png"];
        self.tabBarItem.image = image2;
        
        _addTab = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_addTab addTarget:self
                          action:@selector(addNewTab)
                forControlEvents:UIControlEventTouchUpInside];
        [_addTab setTitle:@"Add Tab ++" forState:UIControlStateNormal];
        _addTab.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [self.view addSubview:_addTab];

    }
    return self;
}

-(void)addNewTab{
    
    
    
    NSString *bagdeValue = [NSString stringWithFormat:@"%d", [self.tabBarItem.badgeValue integerValue]+1];
    [[self tabBarItem] setBadgeValue:bagdeValue];
    
    NSMutableArray *tabArrays = [[NSMutableArray alloc] initWithArray:[super tabBarController].viewControllers];
    
    AddTabViewController *viewController = [[AddTabViewController alloc] init];
    
    [tabArrays addObject:viewController];
    
    [[super tabBarController] setViewControllers:tabArrays];
    
    
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
