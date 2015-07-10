//
//  DMLTableViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-26.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonTableViewController.h"

@interface DMLTableViewController : UICommonTableViewController

@property (strong, nonatomic) NSMutableArray *prdCategories;

@property (strong, nonatomic) NSMutableDictionary *selProduct;

@end
