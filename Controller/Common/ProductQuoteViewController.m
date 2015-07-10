//
//  ProductQuoteViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ProductQuoteViewController.h"
#import <MessageUI/MessageUI.h>
#import "ProductDetailCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ProductQuoteViewController ()

@end

@implementation ProductQuoteViewController

@synthesize product, commTextView;

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
    self.imageView.image = [UIImage imageNamed: product.imgName];
    self.prdName.text = product.name;
    self.prdSeries.text = [NSString stringWithFormat:@"%@:", product.series];
    self.commTextView.text = product.notes;
    
    //NSLog(@"%@", self.product);
    
    /*
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Submit"
                                                                    style:UIBarButtonItemStylePlain target:self
                                                                   action:@selector(submit:)];
     */
    
    //self.navigationItem.rightBarButtonItem = rightButton;
    
    self.mast.text     = self.product.mastHeight == nil ? @"n/a"   : self.product.mastHeight;
    self.carriage.text = self.product.carriage   == nil ? @"n/a"   : self.product.carriage;
    self.fork.text     = self.product.fork       == nil ? @"n/a"   : self.product.fork;
    
    if([self.product.selOptions count] == 0)
        self.selOptionsTable.hidden = YES;
     else
        self.selOptionsTable.hidden = NO;
    
    self.product.additionalOption = @"";
    
    for(id o in self.product.selOptions) {
        self.product.additionalOption = [self.product.additionalOption stringByAppendingFormat:@"%@,\n", o];
    }
    
    self.commTextView.layer.cornerRadius = 5.0;
    self.commTextView.clipsToBounds = YES;
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    [self sendEmail];
}

-(void) sendEmail {
    if( [MFMailComposeViewController canSendMail] ) {
      mailComposer = [[MFMailComposeViewController alloc]init];
      mailComposer.mailComposeDelegate = self;
      NSString *msg = [NSString stringWithFormat:@"Hello.\nCould you provide product details for the %@: %@.\n Additional Selected Options:\nFork-%@\nCarriage-%@\nMast Height-%@\n\nAdditions:\n%@\nAdditional comments:%@\n\nRegards,\nOML Mobile Application Agent.", product.series, product.name,
                   product.fork == nil ? @"n/a" : product.fork,
                   product.carriage == nil ? @"n/a" : product.carriage,
                   product.mastHeight == nil ? @"n/a" : product.mastHeight,
                   product.additionalOption, commTextView.text];
      [mailComposer setSubject:@"OML Mobile App Product Request"];
      [mailComposer setToRecipients:[NSArray arrayWithObjects:@"wbaggia@xetabyte.com",nil]];
      //[mailComposer setCcRecipients:[NSArray arrayWithObjects:@"skoyev@gmail.com", nil]];
      [mailComposer setMessageBody: msg isHTML:NO];
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
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Email Quote"
                                                    message:@"Your request for a quote has been sent to the Omega Lift Sales Team."
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];    
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.product.selOptions count] > 0 ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.product.selOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *d = [self.product.selOptions objectAtIndex:[indexPath row]];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = d;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:10];    
    
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 20.0;
}

@end
