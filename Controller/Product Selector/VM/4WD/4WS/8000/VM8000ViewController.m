//
//  VM8000ViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "VM8000ViewController.h"

@interface VM8000ViewController ()

@end

@implementation VM8000ViewController

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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *v = [NSString stringWithFormat:@"%@",[self.products allKeys][[indexPath row]]];
    cell.backgroundColor = [UIColor clearColor];    
    cell.textLabel.text = v;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(20, 0, tableView.frame.size.width, 60.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text = @"Choose one of the following options:";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    
    [header addSubview:textLabel];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

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
    NSString *key = [NSString stringWithFormat:@"%@",[self.products allKeys][[indexPath row]]];
    
    NSMutableDictionary *prd = [self.products objectForKey:key ];
    
    self.selProduct = prd;
    
    //NSLog(@"%@", prd);
    
    NSArray *arrPrd = [prd allKeys];
    
    NSString *p = [arrPrd objectAtIndex:0];
    
    self.selProduct = prd[p];
    
    //[self performSegueWithIdentifier: @"vm8single" sender:self];
    
    UIStoryboard *prdResult = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
    SingleProductViewController *initialVC = [prdResult instantiateInitialViewController];
    initialVC.product = [[Product alloc] initWithDict:self.selProduct];
    initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self addBackButton:initialVC];
    [self.navigationController pushViewController:initialVC animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SingleProductViewController *ctrl = segue.destinationViewController;
    ctrl.title = @"Vertical Mast";
    ctrl.product = [[Product alloc] initWithDict:self.selProduct];
    [self addBackButton:ctrl];    
}

@end
