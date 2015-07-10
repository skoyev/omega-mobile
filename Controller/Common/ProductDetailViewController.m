//
//  ProductDetailViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductDetailCell.h"
#import "ProductQuoteViewController.h"
#import "SingleProductViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

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
    self.prdName.text = self.product.name;
    self.series.text  = [NSString stringWithFormat:@"%@:", self.product.series];
    self.prdImg.image = [UIImage imageNamed:self.product.imgName];
    self.descrView.text = self.product.description;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Request"
                                                            style:UIBarButtonItemStylePlain target:self
                                                               action:@selector(requestQuote:)];
    rightButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    
    if( [self.product.specifications count] == 0 )
        self.specView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestQuote:(id)sender {
    //[self performSegueWithIdentifier:@"quotePrdFromDetails" sender:self];
    [self performSegueWithIdentifier:@"specToSingle" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString: @"quotePrdFromDetails" ] ) {
        ProductQuoteViewController *prdVC = segue.destinationViewController;
        prdVC.product = self.product;
        prdVC.title   = self.product.type;
        [self addBackButton:prdVC];
    } else if( [[segue identifier] isEqualToString: @"specToSingle" ] ) {
        SingleProductViewController *sVC = segue.destinationViewController;
        sVC.product = self.product;
        sVC.title   = self.product.type;
        [self addBackButton:sVC];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.product.specifications count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ProductDetailCell *prdCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (prdCell == nil){
        prdCell = (ProductDetailCell*)[[[NSBundle mainBundle] loadNibNamed:@"ProductDetailCell" owner:nil
                                                                 options:nil] objectAtIndex:0];
    }
    
    NSString *specName  = [NSString stringWithFormat:@"%@",[self.product.specifications allKeys][[indexPath row]]];
    NSString *specValue = [NSString stringWithFormat:@"%@",[self.product.specifications objectForKey:specName]];
    
    prdCell.prdSpecName.text  = specName;
    prdCell.prdSpecValue.text = specValue;
    
    //prdCell.textLabel.font = [UIFont systemFontOfSize:10];
    
    return prdCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
