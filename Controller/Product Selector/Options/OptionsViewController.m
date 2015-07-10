//
//  OptionsViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

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
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height + 70)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
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
    return [self.product.options count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSLog(@"%ld", (long)[indexPath row]);
    NSString *option = [self.product.options objectAtIndex:[indexPath row]];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = option;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.backgroundColor = [UIColor clearColor];
    
    /*
    if([indexPath row] == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        self.lastSelection = indexPath;
        
        self.product.additionalOption = option;
    }
    */
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(85, 0, tableView.frame.size.width, 60.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel        = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text            = @"Additional Options:";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor       = [UIColor whiteColor];    
    
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
    if ( self.lastSelection == indexPath ) return;
    
    UITableViewCell *currCell = [self.tableView cellForRowAtIndexPath: indexPath];
    currCell.tag = currCell.tag == 0 ? 1 : 0;
    
    if( currCell.tag == 0 )
        currCell.accessoryType = UITableViewCellAccessoryNone;
    else
        currCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //[self.tableView cellForRowAtIndexPath: self.lastSelection].accessoryType  = UITableViewCellAccessoryNone;
    //currCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    id obj = [self.product.options objectAtIndex:[indexPath row]];
    
    if( currCell.tag == 1 )
       [self.product.selOptions addObject: obj];
    else if( [self.product.selOptions count] > 0 )
        //[self.product.selOptions removeObjectAtIndex:[indexPath row] - 1];
        [self.product.selOptions removeObject:obj];
    
    //self.product.additionalOption = [self.product.options objectAtIndex:[indexPath row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //self.lastSelection = indexPath;
}

@end
