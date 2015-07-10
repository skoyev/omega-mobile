//
//  VM2WSViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "VM2WSViewController.h"
#import "SingleProductViewController.h"
#import "VM35000ViewController.h"

@interface VM2WSViewController ()

@end

@implementation VM2WSViewController

@synthesize categories;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self sortProductKey];
    
}

-(void) sortProductKey {
    NSArray *keys = [self.categories allKeys];
    self.sortedKeys = [keys sortedArrayUsingComparator:^(id str1, id str2){
        return [((NSString *)str1) compare:((NSString *)str2)
                                      options:NSNumericSearch];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *k = [self.sortedKeys objectAtIndex:[indexPath row]];

    cell.backgroundColor = [UIColor clearColor];    
    cell.textLabel.text = k;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(40, 0, tableView.frame.size.width, 60.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text = @"Select Maximum Capacity (lbs):";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    
    [header addSubview:textLabel];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}
 */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self.sortedKeys objectAtIndex:[indexPath row]];
    
    NSMutableDictionary *prd = [self.categories objectForKey:key ];
    
    //NSLog(@"%@", prd);
    
    if( ![key isEqualToString:@"35000"] ) {
    
        NSArray *arrPrd = [prd allKeys];
    
        NSString *p = [arrPrd objectAtIndex:0];
    
        self.selProduct = prd[p];
    
        //[self performSegueWithIdentifier: @"2wssingle" sender:self];

        UIStoryboard *prdResult = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
        SingleProductViewController *initialVC = [prdResult instantiateInitialViewController];
        initialVC.product = [[Product alloc] initWithDict:self.selProduct];
        initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self addBackButton:initialVC];
        [self.navigationController pushViewController:initialVC animated:YES];        
    } else {
        self.selProduct = prd;
        [self performSegueWithIdentifier: @"vm35000" sender:self];        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"2wssingle" ] ) {
        SingleProductViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"Vertical Mast";
        ctrl.product = [[Product alloc] initWithDict:self.selProduct];
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"vm35000" ] ) {
        VM35000ViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"Vertical Mast";
        ctrl.products = self.selProduct;
        [self addBackButton:ctrl];        
    }
}

@end
