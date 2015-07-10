//
//  VideoGalleryViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface VideoGalleryViewController : UICommonViewController< UITableViewDataSource, UITableViewDelegate > {
    NSMutableDictionary *types;
    NSString *selSerie;
    NSMutableArray *series;
    NSString *selectedVideoId;
    NSString *selectedSerie;
}


@end
