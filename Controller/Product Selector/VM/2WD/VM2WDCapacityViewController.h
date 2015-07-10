//
//  VM2WDCapacityViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonTableViewController.h"

@interface VM2WDCapacityViewController : UICommonTableViewController

@property (retain, nonatomic) NSMutableDictionary *categories;

@property (retain, nonatomic) NSMutableDictionary *selProduct;

@property (retain, nonatomic) NSArray *sortedKeys;

@end
