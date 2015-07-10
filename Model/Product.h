//
//  Product.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-08-16.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject {
}

@property (retain, nonatomic) NSString *additionalOption;

@property (retain, nonatomic) NSString *carriage;

@property (retain, nonatomic) NSString *fork;

@property (retain, nonatomic) NSString *mastHeight;

@property (retain, nonatomic) NSString *type;

@property (retain, nonatomic) NSString *name;

@property (retain, nonatomic) NSString *notes;

@property (retain, nonatomic) NSString *description;

@property (retain, nonatomic) NSString *imgName;

@property (retain, nonatomic) NSString *series;

@property (retain, nonatomic) NSMutableDictionary *specifications;

@property (retain, nonatomic) NSMutableArray *carriages;

@property (retain, nonatomic) NSMutableArray *forks;

@property (retain, nonatomic) NSMutableArray *mastHeights;

@property (retain, nonatomic) NSMutableArray *prdOptions;

@property (retain, nonatomic) NSMutableArray *options;

@property (retain, nonatomic) NSMutableArray *selOptions;

- (id)initWithDict:(NSDictionary *)dict;

@end
