//
//  ContainerViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-14.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController

@property (strong, nonatomic) NSString *currentSegueIdentifier;

- (void)swapViewControllers;

@end
