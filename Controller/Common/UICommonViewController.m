//
//  UICommonViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 15-01-11.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

#import "UICommonViewController.h"

@interface UICommonViewController ()

@end

@implementation UICommonViewController

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
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height + 70)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addBackButton:(UIViewController *) ctrl {
    UIImage *buttonImage = [UIImage imageNamed:@"back1.png"];
    UIButton *forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forwardButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    forwardButton.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [forwardButton addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    ctrl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]                                                                    initWithCustomView:forwardButton];
}

@end
