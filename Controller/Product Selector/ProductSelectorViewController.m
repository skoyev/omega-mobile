//
//  ProductSelectorViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductSelectorViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ProductListViewController.h"
#import "VM2WD4WDViewController.h"
#import "ARMTableViewController.h"
#import "DMLTableViewController.h"

@interface ProductSelectorViewController ()

@end

@implementation ProductSelectorViewController

@synthesize mainScrollView, leftScrollView, rightScrollView, mainImgArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.title = @"Product Selector1";
    //self.navigationController.navigationItem.title = @"Product Selector";
    //self.navigationController.tabBarItem.title = @"Product Selector";
    //self.tabBarController.tabBarItem.title = @"Product Selector";
    //self.tabBarItem.title = @"Product Selector";    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *optionBtn = [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
     target:self action:@selector(exit:)];
                                  
    optionBtn.style = UIBarButtonItemStyleBordered;
                                  
    
    //UIBarButtonItem *optionBtn = [[UIBarButtonItem alloc] initWithTitle:@"Option" style:UIBarButtonItemStylePlain target:self action:@selector(showOption:)];
    
    self.navigationController.navigationItem.rightBarButtonItem = optionBtn;
    
    //self.navigationController.navigationBar.topItem.title = @"Product Selector";
    
    //[self setUpScrollingView];
    [self setImageView];
    
    /*self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                     self.view.frame.size.  width,
                                                                     self.view.frame.size.height)]; */
    
    //self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //self.scrollView.contentSize = CGSizeMake(320, 465);
    //self.scrollView.delegate = self;
    //self.scrollView.pagingEnabled = YES;
    //[self.scrollView setAlwaysBounceVertical:NO];
    
    //NSInteger numberOfViews = 1;
    
    //UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.testImageView.frame];
    
    /*
    self.testImageView.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"splash_prod02_01.gif"],
                                 [UIImage imageNamed:@"splash_prod02_02.gif"],
                                 [UIImage imageNamed:@"splash_prod02_03.gif"],
                                 nil];
    self.testImageView.animationDuration = 4.00;
    self.testImageView.animationRepeatCount = 0;
    [self.testImageView startAnimating];
     */
     
    //imageView.image = [UIImage imageNamed:@"splash_prod02_01.gif"];
    
    
    //[self.testImageView addSubview:imageView];
    
    
    //for (int i = 0; i < numberOfViews; i++) {
        //CGFloat xOrigin = i * self.view.frame.size.width;
        
        //[UIImage imageNamed:@"background01.png"]
        
        //[image setImage:[UIImage imageNamed:@"splash_prod02_01.gif"]];
         
//                                             @"splash_prod02_0%d.gif", i+1]]];
        
        //image.contentMode = UIViewContentModeScaleAspectFit;
        
        //[self.testImageView addSubview:image];
    //}
    
    //set the scroll view content size
    /*
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width *
                                             numberOfViews,
                                             self.scrollView.frame.size.height);
     */
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];    
}

-(void) setImageView {
    mainImgIndex = 0;
    /*
    self.mainImgArr = [NSArray arrayWithObjects:
                       @"2X.png",
                       @"4DML.png",
                       @"44236.png",
                       @"ALPHA.png",
                       @"ARM-XL.png",
                       @"ARM.png",
                       @"HERC.png",
                       @"MEGA.png",
                       @"ML.png",
                       @"UG.png",
                       nil];
     */
    
    self.mainImgArr = [NSArray arrayWithObjects:
                       @"2X.png",
                       @"ARM.png",
                       @"4DML.png",
                       nil];
    
    NSString *imgName = [self.mainImgArr objectAtIndex: mainImgIndex];
    
    self.mainImgView.image = [UIImage imageNamed:imgName];
    
    self.seriesName.text = [self getSeriesNameByImg : imgName ];
    
    /*
    self.mainImgView.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"splash_prod02_01.gif"],
                                          [UIImage imageNamed:@"splash_prod02_02.gif"],
                                          [UIImage imageNamed:@"splash_prod02_03.gif"],
                                          nil];
    
    
    self.mainImgView.animationDuration = 14.00;
    self.mainImgView.animationRepeatCount = 1;
    [self.mainImgView startAnimating];
     */
    
    /*
    CATransition *animation = [CATransition animation];
    [animation setDuration:2.0]; //Animate for a duration of 1.0 seconds
    [animation setType:kCATransitionPush]; //New image will push the old image off
    [animation setSubtype:kCATransitionFromRight]; //Current image will slide off to the left, new image slides in from the right
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    [[self.mainImgView layer] addAnimation:animation forKey:nil];
    
    [self.mainImgView startAnimating];
    
     self.mainImgView.image = [UIImage imageNamed:@"splash_prod02_02.gif"];
     */
    
}


-(void) setUpScrollingView {
    //NSInteger numberOfViews = 2;
    
    self.mainScrollView.pagingEnabled = YES;
    [self.mainScrollView setAlwaysBounceVertical:NO];
    //self.mainScrollView.contentSize = CGSizeMake(320, 465);
    
    /*
    
    for(int i = 0; i < numberOfViews; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.mainScrollView.frame.size.width, 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height)];
        
        imgView.contentMode = UIViewContentModeScaleToFill;
        
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"splash_prod02_0%d.gif",i]]];
        
        [self.mainScrollView addSubview:imgView];
    }
    
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width * numberOfViews, self.mainScrollView.frame.size.height);
     
     */
    
}

- (IBAction)leftBtn:(id)sender {
    if( mainImgIndex >= 1 )
        mainImgIndex --;
    
    NSString *imgName = [self.mainImgArr objectAtIndex: mainImgIndex];
    
    self.mainImgView.image = [UIImage imageNamed:imgName];
    
    self.seriesName.text = [self getSeriesNameByImg : imgName ];
}

-(NSString *) getSeriesNameByImg : (NSString *) imgName {
    if( [imgName isEqualToString:@"2X.png"] )
        return @"Vertical Mast: 2X";
    else if( [imgName isEqualToString:@"4DML.png"] )
        return @"4D MultiLoader";
    else if( [imgName isEqualToString:@"44236.png"] )
        return @"Vertical Mast: 44236";
    else if( [imgName isEqualToString:@"ALPHA.png"] )
        return @"Vertical Mast: ALPHA";
    else if( [imgName isEqualToString:@"ARM-XL.png"] )
        return @"ARM-XL";
    else if( [imgName isEqualToString:@"ARM.png"] )
        return @"ARM";
    else if( [imgName isEqualToString:@"HERC.png"] )
        return @"Vertical Mast: HERC";
    else if( [imgName isEqualToString:@"MEGA.png"] )
        return @"Vertical Mast: MEGA";
    else if( [imgName isEqualToString:@"ML.png"] )
        return @"Vertical Mast: ML";
    else if( [imgName isEqualToString:@"UG.png"] )
        return @"Vertical Mast: UG";
    
    return @"4D MultiLoader";
}

- (IBAction)rightBtn:(id)sender {
    if( mainImgIndex < 2 )
        mainImgIndex ++;
    
    NSString *imgName = [self.mainImgArr objectAtIndex: mainImgIndex];
    
    self.mainImgView.image = [UIImage imageNamed:imgName];
    
    self.seriesName.text = [self getSeriesNameByImg : imgName ];
}

-(void) showOption:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapVM:(id)sender {
    self.type = @"VERTICAL MASS";
    //[self performSegueWithIdentifier:@"vm2wd4wd" sender:self];
    
    UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"VMProductSelector" bundle:nil];
    UIViewController *initialVC = [prdSelector instantiateInitialViewController];
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;    
    
    [self addBackButton:initialVC];

    [self.navigationController pushViewController:initialVC animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"vm2wd4wd" ]) {
        VM2WD4WDViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"Vertical Mast";
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"arm" ] ) {
        ARMTableViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"ARM";
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"4dml" ] ) {
        DMLTableViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"4DML";
        [self addBackButton:ctrl];                
    }
    
    /*
    ProductListViewController *prdVC = segue.destinationViewController;
    prdVC.type = self.type;
    
    // load products by product type
    prdVC.products = [NSMutableArray arrayWithCapacity:15];
    
    NSDictionary *products_ = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-list" ofType:@"plist"]];
    
    NSDictionary *product = [products_ objectForKey:self.type];
    
    for(id key in product){
        NSDictionary *prd = [product objectForKey:key];
        [prdVC.products addObject: [[Product alloc] initWithDict:prd]];
    }
    */
}

- (IBAction)tapARM:(id)sender {
    self.type = @"ARM";
    
    //[self performSegueWithIdentifier:@"arm" sender:self];
    UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"ARMProductSelector" bundle:nil];
    ARMTableViewController *initialVC = [prdSelector instantiateInitialViewController];
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self addBackButton:initialVC];
    [self.navigationController pushViewController:initialVC animated:YES];
}

- (IBAction)tap4DML:(id)sender {
    self.type = @"4DML";
    //[self performSegueWithIdentifier:@"4dml" sender:self];
    
    UIStoryboard *prdSelector = [UIStoryboard storyboardWithName:@"4DMLProductSelector" bundle:nil];
    DMLTableViewController *initialVC = [prdSelector instantiateInitialViewController];
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self addBackButton:initialVC];
    [self.navigationController pushViewController:initialVC animated:YES];
}

@end
