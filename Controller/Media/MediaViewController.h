//
//  MediaViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"
#import "UICommonViewController.h"

@interface MediaViewController : UICommonViewController

@property (nonatomic, weak) ContainerViewController *containerViewController;

- (IBAction)tapTopControll:(id)sender;

@end
