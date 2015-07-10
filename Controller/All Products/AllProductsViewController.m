//
//  AllProductsViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "AllProductsViewController.h"
#import "Product.h"
#import "AllProductCell.h"
#import "ProductListViewController.h"
#import "Series.h"
#import "SeriesByCategoryViewController.h"

@interface AllProductsViewController ()

@end

@implementation AllProductsViewController

@synthesize products, allProductsTabItem, series;

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
     //self.title = @"All Products";
    [self loadSeries];
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
   
    self.logoView.image = [UIImage imageNamed:@"Omega Lift Logo.png"];    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.navigationController.navigationItem.title = @"ALL PRODUCTS";
}

-(void) loadSeries {
    //self.products = [NSMutableArray arrayWithCapacity:4];
    self.series   = [NSMutableArray arrayWithCapacity:4];
    
    NSDictionary *types = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-types" ofType:@"plist"]];
    
    for(id key in types) {
        NSDictionary *type = [types objectForKey:key];
        
       // NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:[type objectForKey:@"description"], @"description", [type objectForKey:@"img"], @"imgName", [type objectForKey:@"name"], @"type", nil];
        
        
        Series* serie = [[Series alloc] init];
        serie.name        = [type objectForKey:@"name"];
        serie.img         = [type objectForKey:@"img"];
        serie.description = [type objectForKey:@"description"];
        serie.series      = [type objectForKey:@"series"];
        serie.seriesImg   = [type objectForKey:@"series_img"];
        serie.weight      = [type objectForKey:@"weight"];
        
        //[self.products addObject: [[Product alloc] initWithDict:d]];
        [self.series addObject:serie];
    }    
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
    return [series count];
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
    
    AllProductCell *prdCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (prdCell == nil){
        prdCell = (AllProductCell*)[[[NSBundle mainBundle] loadNibNamed:@"AllProductCell" owner:nil
                                                              options:nil] objectAtIndex:0];
    }
    
    // Configure the cell...
    Series *p = [self.series objectAtIndex:[indexPath row]];
    prdCell.descr.text = p.name;
    //prdCell.imageView.frame = CGRectMake(0, 0, 90, 79);
    prdCell.imageView.image = [UIImage imageNamed:p.img];
    //prdCell.detailsView.text = p.description;
    prdCell.weight.text = p.weight;
    
    prdCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return prdCell;
}

- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath {
    
    [self next:indexPath];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    //self.selectedRow = [newIndexPath row];
    [self next:newIndexPath];
}

-(void) next:(NSIndexPath *)indexPath {
    Series *s = [self.series objectAtIndex:[indexPath row]];
    self.selSeries = s;
    
    //[self performSegueWithIdentifier:@"allPrdSeries" sender:self];
    UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"AllProducts" bundle:nil];
    SeriesByCategoryViewController *initialVC = [prdSelector instantiateInitialViewController];
    initialVC.series = self.selSeries;
    initialVC.title  = self.selSeries.name;
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self addBackButton:initialVC];
    [self.navigationController pushViewController:initialVC animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {    
    SeriesByCategoryViewController *prdVC = segue.destinationViewController;
    prdVC.series = self.selSeries;
    prdVC.title  = self.selSeries.name;
    [self addBackButton:prdVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
