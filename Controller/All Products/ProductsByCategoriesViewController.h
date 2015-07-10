//
//  ProductsByCategoriesViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-11-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface ProductsByCategoriesViewController : UICommonViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *descrView;

@property (strong, nonatomic) IBOutlet UITableView *prdTable;

@property (strong, nonatomic) NSMutableDictionary *products;

@property (strong, nonatomic) IBOutlet UILabel *serieLabel;

@property (strong, nonatomic) IBOutlet UILabel *serieWeight;

@property (nonatomic, copy) NSString *serie;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, strong) NSString *descr;

@end
