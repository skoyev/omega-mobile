//
//  Category.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-29.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject

@property (retain, nonatomic) NSString *name;

@property (retain, nonatomic) NSMutableDictionary *subCategories;

- (id)initWithParams:(NSMutableDictionary *)dict name:(NSString *)name_;

@end
