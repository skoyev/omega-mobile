//
//  ProductListViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "UICommonTableViewController.h"

@interface ProductListViewController : UICommonTableViewController

@property (strong, nonatomic) NSMutableArray *products;

@property (strong, nonatomic) Product *product;

@property (nonatomic, copy) NSString *type;

@end
