//
//  ProductSelectorViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface ProductSelectorViewController : UICommonViewController {
    int mainImgIndex;
}

@property (strong, nonatomic) IBOutlet UILabel *seriesName;

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (strong, nonatomic) IBOutlet UIScrollView *leftScrollView;

@property (strong, nonatomic) IBOutlet UIScrollView *rightScrollView;

@property (strong, nonatomic) IBOutlet UIImageView *mainImgView;

@property (strong, nonatomic) NSArray *mainImgArr;

@property (nonatomic, copy) NSString *type;

@property (strong, nonatomic) IBOutlet UITabBar *navBar;

- (IBAction)tapARM:(id)sender;

- (IBAction)tap4DML:(id)sender;

- (IBAction)tapVM:(id)sender;

- (IBAction)leftBtn:(id)sender;

- (IBAction)rightBtn:(id)sender;

@end
