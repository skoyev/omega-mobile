//
//  SeriesByCategoryViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-30.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "SeriesByCategoryViewController.h"
#import "AllProductDetailCell.h"
#import "ProductDetailViewController.h"
#import "ProductsByCategoriesViewController.h"

@interface SeriesByCategoryViewController ()

@end

@implementation SeriesByCategoryViewController

@synthesize series;

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
    self.imgView.image = [UIImage imageNamed:self.series.seriesImg];
    self.descr.text    = self.series.description;
    
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
    return 88.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.series.series count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    /*
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    */
    AllProductDetailCell *prdCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (prdCell == nil){
        prdCell = (AllProductDetailCell*)[[[NSBundle mainBundle] loadNibNamed:@"AllProductDetailCell" owner:nil
                                                                options:nil] objectAtIndex:0];
    }

    //NSString *v = [NSString stringWithFormat:@"%@",[self.series.series allKeys][[indexPath row]]];
    //NSMutableDictionary *d = [self.series.series objectForKey:v];
    
    NSMutableDictionary *d = [self getSerieByValue:indexPath];

    prdCell.serie.text = [d objectForKey:@"serie"];
    //prdCell.serie.text = v;
    //prdCell.imageView.frame  = CGRectMake(0, 0, 90, 79);
    prdCell.imageView.image  = [UIImage imageNamed:[d objectForKey:@"img"]];
    prdCell.capacity.text = [d objectForKey:@"load capacity"];
    prdCell.liftHeight.text = [d objectForKey:@"lift height"];
    
    prdCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return prdCell;
}

-(id) getSerieByValue: (NSIndexPath *) indexPath {
    for(id key in self.series.series) {
        id value = [self.series.series objectForKey:key];
        NSString *order = [value objectForKey: @"all-product order"];
        if( [order isEqualToString:[NSString stringWithFormat:@"%ld", (long)[indexPath row] ]] ) {
            return value;
        }
    }
    
    return nil;
}

- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath {
    
    [self next:indexPath];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    [self next:newIndexPath];
    
    /*
    if( [ser isEqualToString:@"UG"] ) {
        NSString *prdKey = [NSString stringWithFormat:@"%@",[self.selProducts allKeys][[newIndexPath row]]];
        NSMutableDictionary *prd = [self.selProducts objectForKey:prdKey];
        
        UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
        ProductDetailViewController *initialVC = [prdSelector instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
        initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        initialVC.product = [[Product alloc] initWithDict:prd];
        initialVC.title   = @"UG";
        [self.navigationController pushViewController:initialVC animated:YES];
    } else {
        [self performSegueWithIdentifier: @"prdByCategories" sender:self];
    }   
     */
}

-(void) next:(NSIndexPath *)indexPath {
    //NSString *ser = [NSString stringWithFormat:@"%@",[self.series.series allKeys][[indexPath row]]];
    //NSMutableDictionary *d = [self.series.series objectForKey:ser];
    NSMutableDictionary *d = [self getSerieByValue:indexPath];
    
    self.selProducts     = [d objectForKey:@"products"];
    self.selProductSerie = [d objectForKey:@"serie"];
    self.selSerieWeight  = [d objectForKey:@"weight"];
    self.selProductDescr = [d objectForKey:@"description"];
    
    [self performSegueWithIdentifier: @"prdByCategories" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"prdByCategories" ]) {
        ProductsByCategoriesViewController *ctrl = segue.destinationViewController;
        ctrl.title    = self.selProductSerie;
        ctrl.products = self.selProducts;
        ctrl.weight   = self.selSerieWeight;
        ctrl.serie    = self.selProductSerie;
        ctrl.descr    = self.selProductDescr;
        [self addBackButton:ctrl];                
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
