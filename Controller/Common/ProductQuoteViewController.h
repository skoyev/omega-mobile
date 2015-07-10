//
//  ProductQuoteViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Product.h"
#import "UICommonViewController.h"

@interface ProductQuoteViewController : UICommonViewController<MFMailComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate> {
    
    MFMailComposeViewController *mailComposer;
    
}
@property (strong, nonatomic) IBOutlet UILabel *fork;

@property (strong, nonatomic) IBOutlet UILabel *carriage;

@property (strong, nonatomic) IBOutlet UILabel *mast;

@property (strong, nonatomic) Product *product;

@property (strong, nonatomic) IBOutlet UITextView *commTextView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *prdName;

@property (strong, nonatomic) IBOutlet UILabel *prdSeries;

@property (strong, nonatomic) IBOutlet UITableView *selOptionsTable;

- (IBAction)submit:(id)sender;

@end
