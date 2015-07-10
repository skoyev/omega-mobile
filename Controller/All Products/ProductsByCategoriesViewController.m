//
//  ProductsByCategoriesViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-11-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductsByCategoriesViewController.h"
#import "SingleProductViewController.h"
#import "ProductDetailViewController.h"
#import "ProductQuoteViewController.h"

@interface ProductsByCategoriesViewController ()

@end

@implementation ProductsByCategoriesViewController

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
    self.serieLabel.text  = self.serie;
    self.serieWeight.text = self.weight;
    self.descrView.text   = self.descr;
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }         
    
     //NSString *key          = [NSString stringWithFormat:@"%@",[self.products allKeys][[indexPath row]]];
     //NSMutableDictionary *d = [self.products objectForKey:key];
    
     NSMutableDictionary *d = [self getProductByOrder:indexPath];
    
     //prdCell.description.text = v;
     //prdCell.imageView.frame  = CGRectMake(0, 0, 90, 79);
     //cell.imageView.image  = [UIImage imageNamed:[d objectForKey:@"img"]];
    
     cell.textLabel.text      = [d objectForKey:@"name"];
     cell.textLabel.textColor = [UIColor whiteColor];
    
     cell.backgroundColor = [UIColor clearColor];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
     return cell;
}

-(id) getProductByOrder: (NSIndexPath *) indexPath {
    for(id key in self.products) {
        id value = [self.products objectForKey:key];
        NSString *order = [value objectForKey: @"order"];
        if( [order isEqualToString:[NSString stringWithFormat:@"%ld", (long)[indexPath row] ]] ) {
            return value;
        }
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    //NSString *key           = [NSString stringWithFormat:@"%@",[self.products allKeys][[newIndexPath row]]];
    //NSMutableDictionary *d  = [self.products objectForKey:key];
    
    NSMutableDictionary *d = [self getProductByOrder:newIndexPath];
    
    UIStoryboard *prdResult = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
    Product *p = [[Product alloc] initWithDict:d];
    
    /* if( [p.type isEqualToString:@"UG"]) {*/
        ProductDetailViewController *dCtrl = [prdResult instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
        dCtrl.product = p;
        dCtrl.title   = p.series;
        dCtrl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self addBackButton:dCtrl];
        
        [self.navigationController pushViewController:dCtrl animated:YES];
    /*
    } else {
        SingleProductViewController *initialVC = [prdResult instantiateInitialViewController];
        initialVC.product = [[Product alloc] initWithDict:d];
        initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
        [self.navigationController pushViewController:initialVC animated:YES];
    }
     */
    
    //[self performSegueWithIdentifier: [ser isEqualToString:@"UG"] ? @"prdByCategories" : @"vmUGPrd" sender:self];
}

- (IBAction)requestQuote:(id)sender {
    UIStoryboard *prdResult = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
    //Product *p = [[Product alloc] initWithDict:d];
    

    ProductDetailViewController *dCtrl = [prdResult instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    //dCtrl.product = p;
    dCtrl.title  = self.serie;
    dCtrl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self addBackButton:dCtrl];
    
    [self.navigationController pushViewController:dCtrl animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
