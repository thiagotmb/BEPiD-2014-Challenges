//
//  TMBUserTableViewCell.m
//  Challenge_20140716_TableView_Dinamica4
//
//  Created by Thiago Bernardes on 7/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBUserTableViewCell.h"

@implementation TMBUserTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
