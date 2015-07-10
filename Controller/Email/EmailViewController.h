//
//  EmailViewController.h
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "UICommonViewController.h"

@interface EmailViewController : UICommonViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate, MFMailComposeViewControllerDelegate, UIAlertViewDelegate> {
    
    NSArray *_pickerData;
    BOOL isPickerDisplay;
    NSMutableArray *selAttachements;
    MFMailComposeViewController *mailComposer;    
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIPickerView *brochurePicker;

@property (strong, nonatomic) IBOutlet UITextField *emailAddress;

@property (strong, nonatomic) IBOutlet UITextView *emailMessage;

@property (strong, nonatomic) IBOutlet UITextField *emailSubject;

- (IBAction)tapSelectBrochure:(id)sender;

- (IBAction)sendEmail:(id)sender;
@end
