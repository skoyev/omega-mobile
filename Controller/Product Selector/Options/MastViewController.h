//
//  MastViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface MastViewController : UITableViewController

@property (strong, nonatomic) Product *product;

@property (nonatomic, strong) NSIndexPath *lastSelection;

@end
