//
//  TMBViewController.m
//  Challenge_20140901_Autorotation
//
//  Created by Thiago-Bernardes on 9/1/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBViewController.h"

@interface TMBViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPopoverControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic) UIPopoverController *popOver;
@end

@implementation TMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeImage:(id)sender {
    
   self.imagePicker = [[UIImagePickerController alloc] init];
    
    self.imagePicker.delegate = self;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        self.popOver = [[UIPopoverController alloc] initWithContentViewController:self.imagePicker];
        self.popOver.delegate = self;
        [self.popOver presentPopoverFromRect:self.imageView.frame inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    }else{
        
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.imagePicker animated:YES completion:nil];

    }
    

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
