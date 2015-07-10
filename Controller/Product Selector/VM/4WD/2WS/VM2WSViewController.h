//
//  VM2WSViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonTableViewController.h"

@interface VM2WSViewController : UICommonTableViewController

@property (retain, nonatomic) NSDictionary *categories;

@property (retain, nonatomic) NSMutableDictionary *selProduct;

@property (retain, nonatomic) NSArray *sortedKeys;

@end
