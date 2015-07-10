//
//  EmailViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "EmailViewController.h"
#import "EmailAttachmentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>

@interface EmailViewController ()

@end

@implementation EmailViewController

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
    //self.title = @"Email";
    
    //self.brochurePicker.hidden = YES;
    //isPickerDisplay = NO;
    
    // Initialize Data
    //_pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    
    selAttachements = [NSMutableArray arrayWithCapacity:10];
    
    self.emailMessage.layer.cornerRadius = 5.0;
    self.emailMessage.clipsToBounds = YES;
    self.emailMessage.text = @"Type your message...";
    self.emailMessage.textColor = [UIColor lightGrayColor];

    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Type your message..."]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Type your message...";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapSelectBrochure:(id)sender {    
    //[self scrollUpView];
    [self performSegueWithIdentifier:@"emailAttach" sender:self];
    
}

- (IBAction)sendEmail:(id)sender {
    [self sendEmail];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
    
}

- (void)scrollUpView {
    [self.scrollView setContentOffset:CGPointMake(0,150) animated:YES];
}

-(void) sendEmail {
    if( [MFMailComposeViewController canSendMail] && [self.emailAddress.text length] > 0) {
        mailComposer = [[MFMailComposeViewController alloc]init];
        mailComposer.mailComposeDelegate = self;
        NSString *msg = [NSString stringWithFormat:@"Hello.\n%@.\n\nRegards,\nOML Mobile Application Agent.", self.emailMessage.text];
        [mailComposer setSubject:self.emailSubject.text];
        [mailComposer setToRecipients:[NSArray arrayWithObjects:self.emailAddress.text,nil]];
        //[mailComposer setCcRecipients:[NSArray arrayWithObjects:@"skoyev@gmail.com", nil]];        
        [mailComposer setMessageBody: msg isHTML:NO];
        
        if( [selAttachements count] > 0)
            for(id att in selAttachements) {
                NSString *prdURL = [NSString stringWithFormat:@"http://www.omegalift.net/prod-pdfs/%@-metric.pdf", att];
                NSURL *url = [NSURL URLWithString:prdURL];
                NSData *data = [[NSData alloc] initWithContentsOfURL:url];
                NSString *fileName = [NSString stringWithFormat:@"%@-metric.pdf", att];
                [mailComposer addAttachmentData:data mimeType:@"application/pdf" fileName:fileName];
            }
        
        [self presentViewController:mailComposer animated:YES completion:nil];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        //NSLog(@"Result : %d",result);
        [self sentCompleted];
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) sentCompleted {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"OML Email"
                                                    message:@"Your message has been sent to the Omega Lift Sales Team."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        //[self performSegueWithIdentifier:@"homeSequeu" sender:self];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"HomeNavigationController"];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:vc animated:YES completion:NULL];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [selAttachements removeAllObjects];
    
    EmailAttachmentViewController *ctrl = segue.destinationViewController;
    ctrl.selAttachements = selAttachements;
    ctrl.title   = @"Product Brochures";
    [self addBackButton:ctrl];            
}

-(void)hideShowPickerView {    
    if (!isPickerDisplay) {
        [UIView animateWithDuration:0.50 animations:^{
            CGRect temp = self.brochurePicker.frame;
            temp.origin.y = self.view.frame.size.height - self.brochurePicker.frame.size.height;
            self.brochurePicker.frame = temp;
        } completion:^(BOOL finished) {
            NSLog(@"picker displayed");
            isPickerDisplay = YES;
            self.brochurePicker.hidden = !self.brochurePicker.hidden;
        }];
    }else {
        [UIView animateWithDuration:0.50 animations:^{
            CGRect temp = self.brochurePicker.frame;
            temp.origin.y = self.view.frame.size.height;
            self.brochurePicker.frame = temp;
        } completion:^(BOOL finished) {
            NSLog(@"picker hide");
            isPickerDisplay = NO;
        }];
    }
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

@end
