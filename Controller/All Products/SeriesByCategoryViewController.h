//
//  SeriesByCategoryViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-30.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Series.h"
#import "UICommonViewController.h"

@interface SeriesByCategoryViewController : UICommonViewController<UITableViewDataSource, UITableViewDelegate> {
}
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UITextView *descr;
@property (strong, nonatomic) IBOutlet UITableView *seriesTable;

@property (strong, nonatomic) NSMutableDictionary *selProducts;

@property (nonatomic, copy) NSString *selProductSerie;
@property (nonatomic, copy) NSString *selSerieWeight;
@property (nonatomic, copy) NSString *selProductDescr;

@property (strong, nonatomic) Series *series;

@end
