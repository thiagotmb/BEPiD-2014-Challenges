//
//  AppInfoViewController.m
//  desafio25062014
//
//  Created by Thiago Bernardes on 6/25/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AppInfoViewController.h"

@interface AppInfoViewController ()

@end

@implementation AppInfoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem.title = @"Notifications";
        UIImage *image1 = [UIImage imageNamed:@"fig1.png"];
        self.tabBarItem.image = image1;
        
        _numberOfNotifications = [[UIApplication sharedApplication] applicationIconBadgeNumber];
        
       _notification = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_notification addTarget:self
                   action:@selector(addNotificationInApp)
         forControlEvents:UIControlEventTouchUpInside];
        [_notification setTitle:@"Add Notification" forState:UIControlStateNormal];
        _notification.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [self.view addSubview:_notification];
        

        

    }
    return self;
}

-(void)addNotificationInApp{
    
   
    NSString *bagdeValue = [NSString stringWithFormat:@"%d", [self.tabBarItem.badgeValue integerValue]+1];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:_numberOfNotifications++];
    [[self tabBarItem] setBadgeValue:bagdeValue];
    
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"ALERTA!!!!!";
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    //note.soundName = UILocalNotificationDefaultSoundName;

    
    [note setSoundName:@"myNot.caf"];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    

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
