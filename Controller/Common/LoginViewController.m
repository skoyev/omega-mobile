//
//  ViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-09.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "LoginViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userID, password, logoView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.logoView.image = [UIImage imageNamed:@"OML_logo_02.png"];
    
    self.logoView.image = [UIImage imageNamed:@"OML.png"];
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height + 70)];
    
    bgImage.image = [UIImage imageNamed:@"launch_background.jpg"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    
    //UIImage *backgrImg  = [UIImage imageNamed:@"launch_background.png"];
    
    //CGRect area = CGRectMake(0, 0, 320, 460);
    
    //UIImageView *imageView = [[UIImageView alloc] initWithFrame:area];
    //[imageView setImage:backgrImg];
    //imageView.alpha = 0.95;
    
    //[self.view addSubview:imageView ];
    //[self.view sendSubviewToBack:imageView];
    
    self.activityInd.hidesWhenStopped = YES;
    [self.activityInd stopAnimating];
    
    maxscroll = [_scrollView bounds].origin.y + 80.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    [self loginInner];
}

-(void) loginInner {
    NSError *error;
    NSString *url = @"http://omagelift-auth.xetabyte.com/api/authorize/login";
    
    if( userID.text == (id) [NSNull null] ||
       [userID.text length] == 0 ||
       [userID.text isEqualToString:@""] ||
       password.text == (id) [NSNull null] ||
       [password.text length] == 0 ||
       [password.text isEqualToString:@""] )
        return;
    self.activityInd.hidden = NO;
    [self.activityInd startAnimating];
    
    NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:[self md5:password.text], @"userpassword", userID.text, @"useremail", nil];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:d options:NSJSONWritingPrettyPrinted error:&error];
    
    NSURL *myUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myUrl];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:queue
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *error) {
         [self.activityInd stopAnimating];
         self.activityInd.hidden = YES;
         if ([data length] > 0 && error == nil) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self parseResponse:data];
             });
         } else {
             [self showError];
         }
     }];
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

- (void) parseResponse:(NSData *) data {
    /*
    NSString *myData = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"JSON data = %@", myData);
    */
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSString *res = [json objectForKey:@"result"];
    
    //NSLog(@"res = %@", res);
    
    if ([res isEqualToString:@"true"]) {
        [self performSegueWithIdentifier:@"homeIdent" sender:self];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"OML Login Error"
                                                        message:@"User name or password is invalid. Please contact OML support team."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void) showError {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"OML Login Error"
                                                    message:@"Network communication error."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        userID.text   = @"";
        password.text = @"";
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *) textField {
    if( textField.tag == 1 )
        [password becomeFirstResponder];
    else {
        [textField resignFirstResponder];
        [self loginInner];
    }
    return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
    }
    
    //cell.textLabel.textColor = [UIColor lightGrayColor];
    
    // Configure the cell...
    if( [indexPath row] == 0 ) {
        userID = [[UITextField alloc]initWithFrame:CGRectMake(15, 7, 150, 32)];
        userID.placeholder = @"Email Address";
        userID.delegate = self;
        userID.tag = 1;
        userID.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [userID setReturnKeyType:UIReturnKeyNext];
        
        [cell.contentView addSubview:userID];
    } else if( [indexPath row] == 1 ){
        password = [[UITextField alloc]initWithFrame:CGRectMake(15, 7, 100, 32)];
        password.placeholder = @"Password";
        password.delegate = self;
        password.secureTextEntry = YES;
        password.tag = 2;
        [password setReturnKeyType:UIReturnKeyDone];
        
        [cell.contentView addSubview:password];
    }
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver: self
                                          selector   : @selector(keyboardWillShow:)
                                          name       : UIKeyboardWillShowNotification
                                          object     : nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                          selector   : @selector(keyboardWillHide:)
                                          name       : UIKeyboardWillHideNotification
                                          object     : nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(id)sender {
    CGPoint scrollPoint = [_scrollView bounds].origin;
    scrollPoint.x = 0;
    if(scrollPoint.y != maxscroll)
        scrollPoint.y += 80;
    [_scrollView setContentOffset:scrollPoint animated:YES];
}

-(void)keyboardWillHide:(id)sender {
    CGPoint scrollPoint = [_scrollView bounds].origin;
    scrollPoint.x = 0;
    scrollPoint.y -= 80;
    [_scrollView setContentOffset:scrollPoint animated:YES];
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Associate"])
    {
        TranslationQuizAssociateVC *translationQuizAssociateVC = [segue destinationViewController];
        translationQuizAssociateVC.nodeID = self.nodeID; //--pass nodeID from ViewNodeViewController
        translationQuizAssociateVC.contentID = self.contentID;
        translationQuizAssociateVC.index = self.index;
        translationQuizAssociateVC.content = self.content;
    }
}
 */

@end
