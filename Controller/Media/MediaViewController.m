//
//  MediaViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "MediaViewController.h"

@interface MediaViewController ()

@end

@implementation MediaViewController

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
    //self.title = @"Media";
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapTopControll:(UISegmentedControl *)sender {
    if( sender.selectedSegmentIndex == 0 ) {
        self.containerViewController.currentSegueIdentifier = @"brochure";
    } else if( sender.selectedSegmentIndex == 1 ) {
        //self.containerViewController.currentSegueIdentifier = @"image";
        self.containerViewController.currentSegueIdentifier = @"imageGalNew";
    } else if( sender.selectedSegmentIndex == 2 ) {
        self.containerViewController.currentSegueIdentifier = @"video";
    }
    
    [self.containerViewController swapViewControllers];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"main" ] ) {
        self.containerViewController = segue.destinationViewController;
        [self addBackButton:self.containerViewController];        
    }
}

@end
