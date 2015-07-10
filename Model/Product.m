//
//  Product.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-08-16.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize description, imgName, type, name, series, notes, specifications, carriages, forks, options, mastHeights, additionalOption, mastHeight, carriage, fork, prdOptions;

- (id)initWithDict:(NSDictionary *)dict {
    if( self = [super init]) {
        description = [dict objectForKey:@"description"];
        imgName = [dict objectForKey:@"imgName"];
        type    = [dict objectForKey:@"type"];
        name    = [dict objectForKey:@"name"];
        series  = [dict objectForKey:@"series"];
        specifications = [dict objectForKey:@"specifications"];
        carriages = [dict objectForKey:@"carriages"];
        forks     = [dict objectForKey:@"forks"];
        //masts     = [dict objectForKey:@"masts"];
        options   = [dict objectForKey:@"additional options"];
        mastHeights  = [dict objectForKey:@"mast height"];
        prdOptions   = [dict objectForKey:@"options"];
    }
    
    return self;
}

@end
