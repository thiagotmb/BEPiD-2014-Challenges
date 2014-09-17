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

#define NameFieldTag 1
#define SerialNumberTag 2
#define ValueTag 3

@interface TMBDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic) UIBarButtonItem* popOverMasterSplitViewControllerButtom;

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
    [self setupDelegates];
    [self setupTextFields];
    //[self.splitViewController reloadInputViews];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    

    switch (textField.tag) {
        case NameFieldTag:
            self.item.itemName = [self changedTextFieldText:textField withReplacementString:string];
            break;
        case SerialNumberTag:
            self.item.serialNumber = [self changedTextFieldText:textField withReplacementString:string];

            break;
        case ValueTag:
            self.item.value = [[self changedTextFieldText:textField withReplacementString:string] intValue];

            break;
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ItemChanged" object:self];
    
    return YES;
}

-(NSString*)changedTextFieldText:(UITextField*)textField withReplacementString:(NSString*)string{
    
    if ([string length] == 0) {
       return [NSString stringWithFormat:@"%@",[textField.text substringToIndex:[textField.text length] - 1]];
    }else{
        return [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
}

-(void)setupDelegates{
    
    self.nameField.delegate = self;
    self.serialNumberField.delegate = self;
    self.valueField.delegate = self;
    
}

-(void)setupTextFields{
    
    self.nameField.text = self.item.itemName;
    self.nameField.keyboardType = UIKeyboardTypeAlphabet;
    self.serialNumberField.text = self.item.serialNumber;
    self.serialNumberField.keyboardType = UIKeyboardTypeASCIICapable;
    self.valueField.text = [NSString stringWithFormat:@"%d",self.item.value];
    self.valueField.keyboardType = UIKeyboardTypeNumberPad;

    self.dateLabel.text = [NSString stringWithFormat:@"%@", self.item.dateCreated ];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{


    barButtonItem.title = @"Items";
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
//    UINavigationController *navigation = self.splitViewController.viewControllers[0];
//    
//    
//   UITableViewController* tableView = navigation.viewControllers[0];
//    
//    [self.view setFrame:CGRectMake(tableView.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width - tableView.view.frame.size.width, self.view.frame.size.height )];
//    //[self.view setBackgroundColor:[UIColor blackColor]];
//    [self.view setNeedsDisplay];
    
}


-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.leftBarButtonItem = nil;

}


@end
