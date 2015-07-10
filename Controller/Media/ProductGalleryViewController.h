//
//  ProductGalleryViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonViewController.h"

@interface ProductGalleryViewController : UICommonViewController

@property (retain, nonatomic) NSMutableDictionary *serieDic;

@property (copy, nonatomic)   NSString *serie;

@property (strong, nonatomic) IBOutlet UIImageView *img;

@property (strong, nonatomic) IBOutlet UILabel *serieLbl;
@property (strong, nonatomic) IBOutlet UILabel *capacityLbl;

- (IBAction)tapViewProduct:(id)sender;

@end
