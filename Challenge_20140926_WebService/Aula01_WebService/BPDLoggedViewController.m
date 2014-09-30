//
//  BPDLoggedViewController.m
//  Aula01_WebService
//
//  Created by Thiago-Bernardes on 9/24/14.
//  Copyright (c) 2014 Antonio Silva. All rights reserved.
//

#import "BPDLoggedViewController.h"

@interface BPDLoggedViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)logOut:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *photoUploadStatus;
- (IBAction)pickPhotoAlbum:(id)sender;
- (IBAction)uploadPhoto:(id)sender;

@end

@implementation BPDLoggedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logOut:(id)sender {
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"" forKey:@"User"];
    [userDefaults setObject:@"" forKey:@"Pass"];
    [userDefaults setObject:@"NO" forKey:@"TryLogin"];
    
}
- (IBAction)pickPhotoAlbum:(id)sender {
    
    UIImagePickerController *instance = [[UIImagePickerController alloc] init];
    [instance setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    instance.delegate = self;
    [self presentViewController:instance animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    double compressRatio = 1;
    NSData *imageData = UIImageJPEGRepresentation([info objectForKey:UIImagePickerControllerOriginalImage], 1);
    while ([imageData length] < 50000) {
        compressRatio = compressRatio*0.5;
        imageData = UIImageJPEGRepresentation([info objectForKey:UIImagePickerControllerOriginalImage], compressRatio);
    }
    
    self.imageView.image = [[UIImage alloc] initWithData:imageData];
    self.photoUploadStatus.hidden = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    self.photoUploadStatus.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)uploadPhoto:(id)sender {
    
    NSData* imageData = UIImageJPEGRepresentation(self.imageView.image, 90);
    
    NSString* urlString = @"http://172.16.1.8:8888/uploadphoto.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString* boundary = @"--------------------14144124129123";
    
    NSString* contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData* body = [NSMutableData data];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"userfile\"; filename=\".jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--r\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@" string %@",returnString);
    
    self.photoUploadStatus.text = @"Imagem enviada.";
    
    self.photoUploadStatus.hidden = NO;
    
    
    
}
@end
