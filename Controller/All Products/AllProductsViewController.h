//
//  AllProductsViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Series.h"
#import "UICommonViewController.h"

@interface AllProductsViewController : UICommonViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{
}

@property (strong, nonatomic) IBOutlet UITableView *allProductsTable;

@property (strong, nonatomic) NSMutableArray *products;

@property (strong, nonatomic) NSMutableArray *series;

@property (strong, nonatomic) Series *selSeries;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITabBarItem *allProductsTabItem;

@property (assign, nonatomic) NSInteger *selectedRow;

@property (weak, nonatomic) IBOutlet UIImageView *logoView;

@end
