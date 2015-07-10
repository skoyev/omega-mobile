//
//  MastPickerDelegate.h
//  OML Mobile
//
//  Created by Mac Mini on 15-01-25.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

extern NSString *const Mast_Height;
extern NSString *const Carriage;
extern NSString *const Fork;

@interface AddOptionPrdPickerDelegate : NSObject<UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableArray *data;

@property (strong, nonatomic) NSString *selectedData;

@property (strong, nonatomic) Product *product;

@property (strong, nonatomic) NSString *optionType;

@end
