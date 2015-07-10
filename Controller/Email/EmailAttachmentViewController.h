//
//  EmailAttachmentViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-05.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonTableViewController.h"

@interface EmailAttachmentViewController : UICommonTableViewController {
    NSMutableArray *attachements;
    NSMutableArray *attachementValues;
}

@property (strong, nonatomic) NSMutableArray *selAttachements;

@end
