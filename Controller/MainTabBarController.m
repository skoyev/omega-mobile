//
//  MainTabBarController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-08-14.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    
    //[[self.tabBar.items objectAtIndex:0] setFinishedSelectedImage:[UIImage imageNamed:@"prd-sel-1-1.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"prd-sel-1-1.png"]];
    
    UIColor *yellow = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
    UIColor *gray = [UIColor colorWithRed:228.0f/255.0f green:228.0f/255.0f blue:228.0f/255.0f alpha:1.0f];
    
    [[self.tabBar.items objectAtIndex:0] setTitleTextAttributes:@{NSForegroundColorAttributeName : gray }                                                    forState:UIControlStateNormal];
    [[self.tabBar.items objectAtIndex:0] setTitleTextAttributes:@{NSForegroundColorAttributeName : yellow }                                                    forState:UIControlStateSelected];

    [[self.tabBar.items objectAtIndex:1] setTitleTextAttributes:@{NSForegroundColorAttributeName : gray }                                                    forState:UIControlStateNormal];
    [[self.tabBar.items objectAtIndex:1] setTitleTextAttributes:@{NSForegroundColorAttributeName : yellow }                                                    forState:UIControlStateSelected];
    
    [[self.tabBar.items objectAtIndex:2] setTitleTextAttributes:@{NSForegroundColorAttributeName : gray }                                                    forState:UIControlStateNormal];
    [[self.tabBar.items objectAtIndex:2] setTitleTextAttributes:@{NSForegroundColorAttributeName : yellow }                                                    forState:UIControlStateSelected];
    
    [[self.tabBar.items objectAtIndex:3] setTitleTextAttributes:@{NSForegroundColorAttributeName : gray }                                                    forState:UIControlStateNormal];
    [[self.tabBar.items objectAtIndex:3] setTitleTextAttributes:@{NSForegroundColorAttributeName : yellow }                                                    forState:UIControlStateSelected];
    
    //[[self.tabBar.items objectAtIndex:1] setTitle:@"title B"];
    //[[self.tabBar.items objectAtIndex:2] setTitle:@"title C"];
    //self.navigationController.navigationItem.title = @"Test";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"="
                                                             style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(exit:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // back button
    UIImage *buttonImage = [UIImage imageNamed:@"back1.png"];
    UIButton *forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];    
    [forwardButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    forwardButton.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [forwardButton addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithCustomView:forwardButton];
    
    /*
    for(UITabBarItem *tbItem in [[self tabBar] items])
    {
        [tbItem setFinishedSelectedImage:[self imageForTabBarItem:(int)[tbItem tag] selected:YES]
             withFinishedUnselectedImage:[self imageForTabBarItem:(int)[tbItem tag] selected:NO]];
    }
     */
    
}

- (UIImage *)imageForTabBarItem:(int)tab selected:(BOOL)selected
{
    NSString *imageName;
    switch(tab)
    {
        case 0:
            imageName = [NSString stringWithFormat:@"prd-sel%@.png", selected ? @"(sel)":@""];
            break;
        case 1:
            imageName = [NSString stringWithFormat:@"all%@.png", selected ? @"(sel)":@""];
            break;
        case 2:
            imageName = [NSString stringWithFormat:@"media%@.png", selected ? @"(sel)":@""];
            break;
        case 3:
            imageName = [NSString stringWithFormat:@"email%@.png", selected ? @"(sel)":@""];
            break;
    }
    return [UIImage imageNamed:imageName];
}

- (void) handleBack:(id)sender {
    // pop to root view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

-(void) showOptions {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) exit:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                    message:@"Would you want to exit?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        //home button press programmatically
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:2.0];
        
        //exit app when app is in background
        exit(0);
    }
}

@end
