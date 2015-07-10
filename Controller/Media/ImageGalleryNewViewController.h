//
//  ImageGelleryNewViewController.h
//  OML Mobile
//
//  Created by mac user on 2015-07-05.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface ImageGalleryNewViewController : UICommonViewController< UITableViewDataSource, UITableViewDelegate > {
    
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
