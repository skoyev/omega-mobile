//
//  VM8000ViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleProductViewController.h"
#import "UICommonTableViewController.h"

@interface VM8000ViewController : UICommonTableViewController

@property (retain, nonatomic) NSMutableDictionary *products;

@property (retain, nonatomic) NSMutableDictionary *selProduct;

@end
