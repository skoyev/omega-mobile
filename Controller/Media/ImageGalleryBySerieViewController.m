//
//  ImageGalleryViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ImageGalleryBySerieViewController.h"
#import "MediaViewController.h"
#import "Series.h"

@interface ImageGalleryBySerieViewController ()

@end

@implementation ImageGalleryBySerieViewController

@synthesize serie, images;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainImgIndex = 0;
    
    self.imgSerie.text = self.title;
    
    self.serieLbl.text = self.title;
    
    self.weight.text   = [NSString stringWithFormat:@"%@",[serie objectForKey:@"weight"]];
    
    self.descriptionView.text = [serie objectForKey:@"description"];
    
    self.images = [serie objectForKey:@"image-gallery"];
    
    if( [self.images count] > 0 )
        self.imgView.image = [UIImage imageNamed:[self.images objectAtIndex:mainImgIndex]];
}

-(void) updateScreen {
    if( [self.images count] > 0 )
        self.imgView.image = [UIImage imageNamed:[self.images objectAtIndex:mainImgIndex]];    
    
    //NSMutableDictionary *s = [self getSerieByImgOrder: mainImgIndex];
    
    /*
    self.imgView.image = [UIImage imageNamed:[[series objectAtIndex:mainImgIndex] objectForKey:@"img"]];
    self.imgSerie.text = [NSString stringWithFormat:@"%@ SERIES", [[series objectAtIndex:mainImgIndex] objectForKey:@"serie"]];
    self.serie.text = [[series objectAtIndex:mainImgIndex] objectForKey:@"serie"];
    self.weight.text = [NSString stringWithFormat:@"%@",[[series objectAtIndex:mainImgIndex] objectForKey:@"weight"]];
    self.descriptionView.text = [[series objectAtIndex:mainImgIndex] objectForKey:@"description"];
     */
    
    /*
    if( s == nil )
        return;
    
    self.imgView.image = [UIImage imageNamed:[s objectForKey:@"img"]];
    self.imgSerie.text = [NSString stringWithFormat:@"%@ SERIES", [s objectForKey:@"serie"]];
    self.serie.text = [s objectForKey:@"serie"];
    self.weight.text = [NSString stringWithFormat:@"%@",[s objectForKey:@"weight"]];
    self.descriptionView.text = [s objectForKey:@"description"];
     */
}

/*
-(NSMutableDictionary *)getSerieByImgOrder:(int) order {
    for(id s in series ) {
        id o = [s objectForKey:@"img-order"];
        if( o != nil &&
            [o integerValue] == order )
            return s;
    }
    
    return nil;
}
 */

/*
-(void) loadSeries {
    types = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-types" ofType:@"plist"]];
    NSArray *keys = [types allKeys];
    for(id key in keys){
        NSMutableDictionary *d = [types objectForKey:key];
        NSMutableDictionary *serie = [d objectForKey:@"series"];
        for(id s in [serie allKeys]){
            NSMutableDictionary *o = [serie objectForKey:s];
            [series addObject: o];
        }
    }
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapRight:(id)sender {
    if( mainImgIndex < ([self.images count] - 1)) {
        mainImgIndex ++;
        [self updateScreen];
    }
}

- (IBAction)tapLeft:(id)sender {
    if( mainImgIndex >= 1 ) {
        mainImgIndex --;
        [self updateScreen];
    }
}

@end
