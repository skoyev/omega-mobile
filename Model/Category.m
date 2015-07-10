//
//  Category.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-29.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "Category.h"

@implementation Category

@synthesize name, subCategories;

- (id)initWithParams:(NSMutableDictionary *)dict name:(NSString *)name_ {
    if( self = [super init]) {
        self.subCategories = dict;
        self.name = name_;
    }
    
    return self;
}

@end
