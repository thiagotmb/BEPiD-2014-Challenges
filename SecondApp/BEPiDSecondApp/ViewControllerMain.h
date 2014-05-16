//
//  ViewControllerMain.h
//  BEPiDSecondApp
//
//  Created by Thiago on 5/15/14.
//  Copyright (c) 2014 Thiago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerMain : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>


@property (strong, nonatomic) IBOutlet UITextField *type;


-(void)inputViewType:(UITextField*)type;


@end
