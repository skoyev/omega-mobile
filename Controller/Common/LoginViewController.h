//
//  ViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-09.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    CGFloat maxscroll;
}

- (IBAction)login:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITableView *loginTable;

@property (retain, nonatomic) UITextField *userID;

@property (retain, nonatomic) UITextField *password;

@property (strong, nonatomic) IBOutlet UIButton *loginInBtn;

@property (strong, nonatomic) IBOutlet UIImageView *logoView;

@property (nonatomic, strong) NSMutableData *responseData;

@end
