//
//  HomeViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-16.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "HomeViewController.h"
#import "MediaViewController.h"
#import "EmailViewController.h"
#import "AllProductsViewController.h"
#import "ProductSelectorViewController.h"
#import "MainTabBarController.h"

@interface HomeViewController ()

@end

static int selectedTabIndex = 0;

@implementation HomeViewController

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
    self.title = @"HOME";    
    
    // Product Selector Touch
    self.prdSelectorLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prdSelectotTap:)];
    [self.prdSelectorLabel addGestureRecognizer:tapGesture];

    // All Products Selector Touch
    self.allPrdLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *allPrdTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(allPrdSelectotTap:)];
    [self.allPrdLabel addGestureRecognizer:allPrdTapGesture];

    // Email Selector Touch
    self.emailLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *emailTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emailSelectotTap:)];
    [self.emailLabel addGestureRecognizer:emailTapGesture];

    // Media Selector Touch
    self.mediaLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *mediaTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mediaSelectotTap:)];
    [self.mediaLabel addGestureRecognizer:mediaTapGesture];
    
    //self.logoView.image = [UIImage imageNamed:@"OML_logo_02.png"];
    self.logoView.image = [UIImage imageNamed:@"Omega Lift Logo.png"];    
    
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_background.png"]]];
    
    CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    //UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.navigationController.navigationBarHidden = NO;
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MainTabBarController *mainVC = segue.destinationViewController;
    if( [[segue identifier] isEqualToString:@"prdSelectorIdent"] ){
        mainVC.selectedIndex = selectedTabIndex;        
      
        if( selectedTabIndex == 0 )
            mainVC.title = @"Product Selector";
        else if( selectedTabIndex == 1 )
            mainVC.title = @"All Products";
        else if( selectedTabIndex == 2 )
            mainVC.title = @"Media";
        else if( selectedTabIndex == 3 )
            mainVC.title = @"Email";
    }
}

- (IBAction)tapPrdSelector:(id)sender {
    selectedTabIndex = 0;
    [self performSegueWithIdentifier:@"prdSelectorIdent" sender:sender]; 
}

- (IBAction)tapMedia:(id)sender {
    selectedTabIndex = 2;
    [self performSegueWithIdentifier:@"prdSelectorIdent" sender:sender];
}

- (IBAction)tapEmail:(id)sender {
    selectedTabIndex = 3;
    [self performSegueWithIdentifier:@"prdSelectorIdent" sender:sender];
}

- (IBAction)tapAllPrd:(id)sender {
    selectedTabIndex = 1;
     [self performSegueWithIdentifier:@"prdSelectorIdent" sender:sender];
}

@end
