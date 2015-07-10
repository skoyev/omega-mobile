//
//  Series.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-11-02.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Series : NSObject {
}

@property (retain, nonatomic) NSString *file;

@property (retain, nonatomic) NSString *img;

@property (retain, nonatomic) NSString *seriesImg;

@property (retain, nonatomic) NSString *description;

@property (retain, nonatomic) NSString *name;

@property (retain, nonatomic) NSString *weight;

@property (retain, nonatomic) NSString *capacity;

@property (retain, nonatomic) NSString *liftHeight;

@property (retain, nonatomic) NSMutableDictionary *series;

@end
