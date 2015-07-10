//
//  ProductListCell.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-12.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell

@synthesize name, descrView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
