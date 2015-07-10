//
//  ProductGalleryViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductGalleryViewController.h"
#import "ProductsByCategoriesViewController.h"

@interface ProductGalleryViewController ()

@end

@implementation ProductGalleryViewController

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
	// Do any additional setup after loading the view.
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    
    NSString *imgName = [self.serieDic objectForKey:@"img"];
    
    self.img.image = [UIImage imageNamed:imgName];
    
    self.title = @"Product Gallery";
    
    self.serieLbl.text = [NSString stringWithFormat:@"%@ SERIES", self.serie];
    
    if([self.serieDic objectForKey:@"load capacity"] != nil)
        self.capacityLbl.text = [NSString stringWithFormat:@"LOAD CAPACITY %@", [self.serieDic objectForKey:@"load capacity"]];
    else
        self.capacityLbl.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapViewProduct:(id)sender {
    UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"AllProducts" bundle:nil];
    ProductsByCategoriesViewController *initialVC = [prdSelector instantiateViewControllerWithIdentifier:@"ProductsByCategoriesViewController"];
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    initialVC.products = [self.serieDic objectForKey:@"products"];
    initialVC.serie    = self.serie;
    initialVC.title    = self.serie;
    initialVC.descr    = [self.serieDic objectForKey:@"description"];
    initialVC.weight = [self.serieDic objectForKey:@"weight"];
    [self addBackButton:initialVC];
    [self.navigationController pushViewController:initialVC animated:YES];
}

@end
