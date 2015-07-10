//
//  ProductListCell.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-12.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;

@property (strong, nonatomic) IBOutlet UITextView *descrView;
@end
