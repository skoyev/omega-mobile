//
//  MastViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "MastViewController.h"

@interface MastViewController ()

@end

@implementation MastViewController

@synthesize product, lastSelection;

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
    return [self.product.mastHeights count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *mast = [self.product.mastHeights objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = mast;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];    
    
    if([indexPath row] == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        self.lastSelection = indexPath;
        
        self.product.mastHeight = mast;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(110, 0, tableView.frame.size.width, 40.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel        = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text            = @"Mast Height";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor       = [UIColor whiteColor];
    
    [header addSubview:textLabel];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
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
    if ( self.lastSelection == indexPath ) return;
    
    [self.tableView cellForRowAtIndexPath: self.lastSelection].accessoryType  = UITableViewCellAccessoryNone;
    [self.tableView cellForRowAtIndexPath: indexPath].accessoryType           = UITableViewCellAccessoryCheckmark;
    self.product.mastHeight = [self.product.mastHeights objectAtIndex:[indexPath row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.lastSelection = indexPath;
}

@end
