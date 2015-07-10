//
//  ProductDetailViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "UICommonViewController.h"

@interface ProductDetailViewController : UICommonViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *descrView;

@property (strong, nonatomic) IBOutlet UITableView *specView;

@property (strong, nonatomic) IBOutlet UIImageView *prdImg;

@property (strong, nonatomic) IBOutlet UILabel *series;

@property (strong, nonatomic) IBOutlet UILabel *prdName;

@property (strong, nonatomic) Product *product;

- (IBAction)requestQuote:(id)sender;

@end
