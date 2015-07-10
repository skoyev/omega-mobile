//
//  ARMTableViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonTableViewController.h"

@interface ARMTableViewController : UICommonTableViewController

@property (strong, nonatomic) NSMutableArray *prdCategories;

@property (strong, nonatomic) NSMutableDictionary *selProduct;

@property (strong, nonatomic) NSMutableDictionary *selCategories;

@end
