//
//  TMBContactTableViewCell.h
//  Challenge_20140716_TableView_Dinamica2
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contactFirstName;
@property (weak, nonatomic) IBOutlet UILabel *contactLastName;
@property (weak, nonatomic) IBOutlet UIImageView *contactPhoto;


@end
