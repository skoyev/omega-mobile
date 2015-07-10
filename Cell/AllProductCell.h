//
//  AllProductCell.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-08-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllProductCell : UITableViewCell

@property (readonly, nonatomic) IBOutlet UIImageView *imageView;

@property (readwrite, nonatomic) IBOutlet UILabel *descr;

@property (strong, nonatomic) IBOutlet UITextView *detailsView;

@property (strong, nonatomic) IBOutlet UILabel *weight;

@end
