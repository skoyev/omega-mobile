//
//  SingleProductViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "UICommonViewController.h"
#import "AddOptionPrdPickerDelegate.h"

@interface SingleProductViewController : UICommonViewController<UITextViewDelegate, UITableViewDataSource, UITableViewDelegate>{

}

@property (strong, nonatomic) UIView *curCellView;

@property (strong, nonatomic) Product *product;

@property (strong, nonatomic) NSMutableArray *options;

@property (retain, nonatomic) NSDictionary *selProduct;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *prdName;

@property (strong, nonatomic) IBOutlet UILabel *prdSeries;

@property (strong, nonatomic) IBOutlet UITextView *notesView;

@property (strong, nonatomic) AddOptionPrdPickerDelegate *mastDelegate;

@property (strong, nonatomic) AddOptionPrdPickerDelegate *carriageDelegate;

@property (strong, nonatomic) AddOptionPrdPickerDelegate *forkDelegate;

@property (strong, nonatomic) UIView *mastView;

@property (strong, nonatomic) UIView *forkView;

@property (strong, nonatomic) UIView *carriageView;

- (IBAction)viewPrdDetails:(id)sender;

- (IBAction)requestQuote:(id)sender;

@end
