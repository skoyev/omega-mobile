//
//  ImageGalleryViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGalleryBySerieViewController : UIViewController<UITextViewDelegate> {

   //NSMutableDictionary *types;
    
   //NSMutableArray *series;
    
   NSMutableArray *images;
    
   int mainImgIndex;
}

- (IBAction)tapRight:(id)sender;

- (IBAction)tapLeft:(id)sender;

//-(NSMutableDictionary *)getSerieByImgOrder:(int) order;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *serieLbl;

@property (strong, nonatomic) IBOutlet UILabel *weight;

@property (strong, nonatomic) IBOutlet UITextView *descriptionView;

@property (strong, nonatomic) IBOutlet UILabel *imgSerie;

@property (retain, nonatomic) NSMutableDictionary *serie;

@property (retain, nonatomic) NSMutableArray *images;

@end
