//
//  TMBViewController.m
//  Challenge_20140714_TableView_1
//
//  Created by Thiago Bernardes on 7/14/14.
//  Copyright (c) 2014 TMB. All rights reserved.
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
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    

   
    
    self.navigationItem.title = [NSString stringWithFormat:@"View Controller %d",self.view.tag];
    
    UIImage *flagImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",self.view.tag]];
    
    

    UIImageView* flagView = [[UIImageView alloc] initWithImage: flagImage];
    [flagView setFrame:CGRectMake(0, 0, self.view.bounds.size.width/1.2, self.view.bounds.size.height/3)];
    [flagView setFrame:CGRectMake(self.view.center.x - flagView.frame.size.width/2, self.view.center.y - flagView.frame.size.height/2, self.view.bounds.size.width/1.2, self.view.bounds.size.height/3)];
    
    [self.view addSubview:flagView];
    [self setupViews];

    // Do any additional setup after loading the view.
}

-(void)setupViews{
    
    switch (self.view.tag) {
       case 1:
        case 8:
        case 15:
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 2:
        case 9:
            self.view.backgroundColor = [UIColor orangeColor];
            break;
        case 3:
        case 10:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
        case 4:
        case 11:
            self.view.backgroundColor = [UIColor greenColor];
            break;
        case 5:
        case 12:
            self.view.backgroundColor = [UIColor cyanColor];
            break;
        case 6:
        case 13:
            self.view.backgroundColor = [UIColor blueColor];
            break;
        case 7:
        case 14:
            self.view.backgroundColor = [UIColor purpleColor];
            break;
        default:
            break;
    }

    
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
