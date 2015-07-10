//
//  BrocureViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-14.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface BrochureViewController : UICommonViewController< UITableViewDataSource, UITableViewDelegate > {
    NSMutableDictionary *types;
    NSString *selSerie;
}

-(NSString *) findSerieByIndex:(int) row : (NSDictionary *) series;

-(NSMutableDictionary *) findSerieByOrderID:(int) rowNum : (NSMutableDictionary *) series;

@property (retain, nonatomic) NSMutableArray *armSeries;

@property (retain, nonatomic) NSMutableArray *dmlSeries;

@property (retain, nonatomic) NSMutableArray *vmSeries;

@property (retain, nonatomic) NSMutableDictionary *selSerieDic;

@end
