//
//  TMBDetailViewController.m
//  Challenge_20140916_UISplitViewController
//
//  Created by Thiago-Bernardes on 9/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBDetailViewController.h"
#import "TMBItemStore.h"
#import "TMBItem.h"

@interface TMBDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic,strong) TMBItemStore *itemStore;

@end

@implementation TMBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.itemStore = [TMBItemStore sharedStore];
        self.item = [self.itemStore createItem];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.nameField.text = self.item.itemName;
    self.serialNumberField.text = self.item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d",self.item.value];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", self.item.dateCreated ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
