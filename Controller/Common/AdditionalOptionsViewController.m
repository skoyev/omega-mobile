//
//  AdditionalOptionsViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-16.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "AdditionalOptionsViewController.h"
#import "ProductQuoteViewController.h"
#import "MastViewController.h"
#import "CariageViewController.h"
#import "ForkViewController.h"
#import "OptionsViewController.h"

@interface AdditionalOptionsViewController ()

@end

@implementation AdditionalOptionsViewController

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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 3 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor colorWithRed:34.0f/255.0f green:59.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
    cell.textLabel.textColor = [UIColor whiteColor];

    if( [indexPath section] == 0 ) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if( [indexPath row] == 0 )
            cell.textLabel.text = @"Mast Height";
        else if( [indexPath row] == 1 )
            cell.textLabel.text = @"Carriage";
        else if( [indexPath row] == 2 )
            cell.textLabel.text = @"Fork";
    } else if( indexPath.section == 1 ) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"Additional Options";
    } else if( indexPath.section == 2 ) {
        //cell.textLabel.text = @"Next";
        //cell.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
        
        //cell.textLabel.textColor = [UIColor blackColor];
        //cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( section == 2 )
        return nil;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake((section == 0) ? 20 : 60, 0, tableView.frame.size.width, (section == 0) ? 60.0 : 40.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text = (section == 0) ? @"Choose one of the following options:" : @"Choose additional options:";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    
    [header addSubview:textLabel];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if( section == 0 )
        return 60.0;
    else if( section == 1 )
        return 40.0;
    else if( section == 2 )
        return 40.0;
    
    return 20.0;
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.section == 0 ){
        if( indexPath.row == 0 )
            [self performSegueWithIdentifier:@"mast" sender:self];
        else if( indexPath.row == 1 )
            [self performSegueWithIdentifier:@"carriage" sender:self];
        else if( indexPath.row == 2 )
            [self performSegueWithIdentifier:@"fork" sender:self];
    } else if( indexPath.section == 1 ) {
       [self performSegueWithIdentifier:@"options" sender:self];
    } else if( indexPath.section == 2 ) {
       [self performSegueWithIdentifier:@"submit" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString: @"submit" ] ) {
        ProductQuoteViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = @"Vertical Mast";
        [self addBackButton:ctrl];        
    } else if( [[segue identifier] isEqualToString:@"prdDetails" ] ) {
    } else if( [[segue identifier] isEqualToString:@"mast" ] ) {
        MastViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = @"Vertical Mast";
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"carriage" ] ) {
        CariageViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = @"Vertical Mast";
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"fork" ] ) {
        ForkViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = @"Vertical Mast";
        [self addBackButton:ctrl];
    } else if( [[segue identifier] isEqualToString:@"options" ] ) {
        OptionsViewController *ctrl = segue.destinationViewController;
        ctrl.product = self.product;
        ctrl.title   = @"Vertical Mast";
        [self addBackButton:ctrl];
    }     
}


@end
