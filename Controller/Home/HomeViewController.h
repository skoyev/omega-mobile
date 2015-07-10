//
//  HomeViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-16.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UILabel *prdSelectorLabel;

@property (strong, nonatomic) IBOutlet UILabel *allPrdLabel;

@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

@property (strong, nonatomic) IBOutlet UILabel *mediaLabel;

@property (strong, nonatomic) IBOutlet UIImageView *logoView;

- (IBAction)tapPrdSelector:(id)sender;

- (IBAction)tapMedia:(id)sender;

- (IBAction)tapEmail:(id)sender;

- (IBAction)tapAllPrd:(id)sender;


@end
