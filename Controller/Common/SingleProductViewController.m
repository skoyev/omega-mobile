//
//  SingleProductViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-07-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "SingleProductViewController.h"
#import "ProductQuoteViewController.h"
#import "ProductDetailViewController.h"
#import "AdditionalOptionsViewController.h"
#import "MastViewController.h"
#import "CariageViewController.h"
#import "ForkViewController.h"
#import "OptionsViewController.h"
#import "AddOptionPrdPickerDelegate.h"

@interface SingleProductViewController ()

@end

@implementation SingleProductViewController

@synthesize product, notesView, options, curCellView;
@synthesize mastDelegate, carriageDelegate, forkDelegate, mastView, forkView, carriageView;

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
    
    self.prdName.text = product.name;
    self.prdSeries.text = [NSString stringWithFormat:@"%@:", product.series];
    self.imgView.image = [UIImage imageNamed: product.imgName];
    self.notesView.delegate = self;
    self.title = self.product.type;
    /*
    UIButton *v = [UIButton buttonWithType:UIButtonTypeCustom];
    [v setFrame:CGRectMake(0.0f, 0.0f, 75.0f, 25.0f)];
    [v addTarget:self action:@selector(requestQuote:) forControlEvents:UIControlEventTouchUpInside];
    [v setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:v ];
     */
    
    self.product.selOptions = [NSMutableArray arrayWithCapacity:10];
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];    
    
    //[self addDummyData];
    
    /*
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                    style:UIBarButtonItemStylePlain target:self
                                                                   action:@selector(requestQuote:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (IBAction)viewPrdDetails:(id)sender {
    [self performSegueWithIdentifier:@"prdDetails" sender:self];
}

- (IBAction)requestQuote:(id)sender {
    //[self performSegueWithIdentifier:@"additionalOptions" sender:self];
    [self performSegueWithIdentifier:@"quotePrd" sender:self];    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.product.notes = self.notesView.text;
    
    if( [[segue identifier] isEqualToString: @"quotePrd" ] ) {        
        ProductQuoteViewController *prdVC = segue.destinationViewController;
        prdVC.product = self.product;
        prdVC.title   = self.product.type;
        [self addBackButton:prdVC];
    } else if( [[segue identifier] isEqualToString:@"prdDetails" ] ) {
        ProductDetailViewController *prdVC = segue.destinationViewController;
        prdVC.product = self.product;
        prdVC.title   = self.product.type;
        [self addBackButton:prdVC];
    } else if( [[segue identifier] isEqualToString:@"additionalOptions" ] ) {
        AdditionalOptionsViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = self.product.type;
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"mast" ] ) {
        MastViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = self.product.type;
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"carriage" ] ) {
        CariageViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = self.product.type;
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"fork" ] ) {
        ForkViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = self.product.type;
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"options" ] ) {
        OptionsViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = self.product.type;
        [self addBackButton:ctrl];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.section == 0 ) {
        NSString * optType = [self.product.prdOptions objectAtIndex:indexPath.row];
        if( [optType isEqualToString:Mast_Height] )
            [self showMastPicker];
        else if( [optType isEqualToString:Carriage] )
            [self showCarriagePicker];
        else if( [optType isEqualToString:Fork] )
            [self showForkPicker];
            
        //if( indexPath.row == 0 )
            //[self performSegueWithIdentifier:@"mast" sender:self];
        //else if( indexPath.row == 1 )
            //[self performSegueWithIdentifier:@"carriage" sender:self];
        //else if( indexPath.row == 2 )
            //[self performSegueWithIdentifier:@"fork" sender:self];
    } else if( indexPath.section == 1 ) {
        if( ([self.product.options count] > 0 ) )
            [self performSegueWithIdentifier:@"options" sender:self];
        else
            [self performSegueWithIdentifier:@"quotePrd" sender:self];
    } else if( indexPath.section == 2 ) {
        [self performSegueWithIdentifier:@"quotePrd" sender:self];
    }
}

-(void) showMastPicker {
    if( self.mastDelegate == nil )
        self.mastDelegate = [[AddOptionPrdPickerDelegate alloc] init];
    
    self.mastDelegate.data = self.product.mastHeights;
    self.mastDelegate.product = self.product;
    self.mastDelegate.optionType = Mast_Height;
    
    //UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100,0,0)];
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];    
    picker.backgroundColor = [UIColor lightGrayColor];
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self.mastDelegate;
    picker.delegate   = self.mastDelegate;
    
    self.product.mastHeight = [self.product.mastHeights objectAtIndex:0]; // default value

    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(mastHeightDone)];
    
    // spacer
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexibleItem, btn, nil]];
    
    mastView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                       [[UIScreen mainScreen] bounds].size.height,
                                                       320,
                                                       [[UIScreen mainScreen] bounds].size.height + 50)];
    [mastView addSubview:toolBar];
    [mastView addSubview:picker];
    [self.view addSubview:mastView];
    
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [mastView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 320, 320, 266)];
    } completion:^(BOOL finished) {}];
    
    /*
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [mastView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 320, 320, 266)];
    [UIView commitAnimations];    
     */
}

-(void) mastHeightDone {
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [mastView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, 320, 266)];
    } completion:^(BOOL finished) {}];
}

-(void) showForkPicker {
    if( self.forkDelegate == nil )
        self.forkDelegate = [[AddOptionPrdPickerDelegate alloc] init];
    self.forkDelegate.data = self.product.forks;
    self.forkDelegate.product = self.product;
    self.forkDelegate.optionType = Fork;
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
    picker.backgroundColor = [UIColor lightGrayColor];
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self.forkDelegate;
    picker.delegate   = self.forkDelegate;
    
    self.product.fork = [self.product.forks objectAtIndex:0]; // default value
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(forkDone)];
    
    // spacer
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexibleItem, btn, nil]];
    
    forkView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                       [[UIScreen mainScreen] bounds].size.height,
                                                       320,
                                                       [[UIScreen mainScreen] bounds].size.height + 50)];
    [forkView addSubview:toolBar];
    [forkView addSubview:picker];
    [self.view addSubview:forkView];
    
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [forkView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 320, 320, 266)];
    } completion:^(BOOL finished) {}];    
}

-(void) forkDone {
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [forkView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, 320, 266)];
    } completion:^(BOOL finished) {}];
}

-(void) showCarriagePicker {
    if( self.carriageDelegate == nil )
        self.carriageDelegate = [[AddOptionPrdPickerDelegate alloc] init];
    self.carriageDelegate.data = self.product.carriages;
    self.carriageDelegate.product = self.product;
    self.carriageDelegate.optionType = Carriage;
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 170)];
    picker.backgroundColor = [UIColor lightGrayColor];
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self.carriageDelegate;
    picker.delegate   = self.carriageDelegate;
    
    self.product.carriage = [self.product.carriages objectAtIndex:0]; // default value
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(carriageDone)];
    
    // spacer
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexibleItem, btn, nil]];
    
    carriageView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                       [[UIScreen mainScreen] bounds].size.height,
                                                       320,
                                                       [[UIScreen mainScreen] bounds].size.height + 50)];
    [carriageView addSubview:toolBar];
    [carriageView addSubview:picker];
    [self.view addSubview:carriageView];
    
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [carriageView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 270, 320, 200)];
    } completion:^(BOOL finished) {}];    
}

-(void) carriageDone {
    [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [carriageView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, 320, 266)];
    } completion:^(BOOL finished) {}];
}

/*
-(void) showForkPicker {
    self.forkDelegate = [[AddOptionPrdPickerDelegate alloc] init];
    self.forkDelegate.data = self.product.forks;
    self.forkDelegate.product = self.product;
    self.forkDelegate.optionType = Fork;
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100,0,0)];
    picker.backgroundColor = [UIColor clearColor];
    
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"Select Forks"
                                                      delegate:self.forkDelegate
                                             cancelButtonTitle:@"Done"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:nil];
    
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self.forkDelegate;
    picker.delegate   = self.forkDelegate;
    
    [menu addSubview:picker];
    [menu showInView:self.view.superview];
    
    //[menu setBounds:CGRectMake(0,0,320, 415)];
    [menu setBounds:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];    
}
 */

/*
-(void) showCarriagePicker {
    self.carriageDelegate = [[AddOptionPrdPickerDelegate alloc] init];
    self.carriageDelegate.data = self.product.carriages;
    self.carriageDelegate.product = self.product;
    self.carriageDelegate.optionType = Carriage;
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100,0,0)];
    picker.backgroundColor = [UIColor clearColor];
    
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"Select Carriage"
                                                      delegate:self.carriageDelegate
                                             cancelButtonTitle:@"Done"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:nil];
    
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self.carriageDelegate;
    picker.delegate   = self.carriageDelegate;
    
    [menu addSubview:picker];
    [menu showInView:self.view.superview];
    
    //[menu setBounds:CGRectMake(0,0,320, 415)];
    [menu setBounds:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];    
}
 */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return (([self.product.options count] > 0 )) ? 3 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == 0 ) {
        return [self.product.prdOptions count];
    } else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    if( [indexPath section] == 0 ) {
        cell.textLabel.text = [self.product.prdOptions objectAtIndex:indexPath.row];
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor colorWithRed:34.0f/255.0f green:59.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
        cell.textLabel.textColor = [UIColor whiteColor];
    } else if( indexPath.section == 1 ) {
        if( ([self.product.options count] > 0 ) ) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Additional Options";
            cell.backgroundColor = [UIColor colorWithRed:34.0f/255.0f green:59.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
            cell.textLabel.textColor = [UIColor whiteColor];
        } else {
            cell.textLabel.text = @"Next";
            cell.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.textColor = [UIColor blackColor];
        }
    } else if( indexPath.section == 2 ) {
        cell.textLabel.text = @"Next";
        cell.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( section == 2 )
        return nil;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake((section == 0) ? 20 : 50, 0, tableView.frame.size.width, (section == 0) ? 50.0 : 30.0)];
    header.backgroundColor = [UIColor clearColor];
    
    if( ([self.product.options count] > 0 ) ) {
        UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
        textLabel.text = (section == 0) ? @"Choose one of the following options:" : @"Choose additional options:";
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        [header addSubview:textLabel];
    } else {
        UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
        textLabel.text = (section == 0) ? @"Choose one of the following options:" : @"";
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        [header addSubview:textLabel];
    }
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if( section == 0 )
        return 50.0;
    else if( section == 1 )
        return 30.0;
    else if( section == 2 )
        return 5.0;
    
    return 5.0;
}


@end
