//
//  EmailAttachmentViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-05.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "EmailAttachmentViewController.h"

@interface EmailAttachmentViewController ()

@end

@implementation EmailAttachmentViewController

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
    [self loadAttachements];
}

-(void) loadAttachements {    
    NSMutableDictionary *ds = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"brochures" ofType:@"plist"]];
    
    attachements = [NSMutableArray arrayWithCapacity:[ds count]];
    attachementValues = [NSMutableArray arrayWithCapacity:[ds count]];
    
    for(id key in ds) {
        [attachements addObject: key];
        [attachementValues addObject:[ds objectForKey:key]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [attachements count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    //cell.backgroundColor = [UIColor colorWithRed:34.0f/255.0f green:59.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
    cell.backgroundColor = [UIColor clearColor];    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = [attachements objectAtIndex:[indexPath row]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(20, 0, tableView.frame.size.width - 40, 80.0)];
    header.backgroundColor = [UIColor clearColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:header.frame];
    textLabel.text = @"Choose Product Brochures to attach to email:";
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    textLabel.numberOfLines = 2;
    textLabel.textAlignment = NSTextAlignmentCenter;
    
    [header addSubview:textLabel];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.0;
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
    
    UITableViewCell *currCell = [self.tableView cellForRowAtIndexPath: indexPath];
    currCell.tag = currCell.tag == 0 ? 1 : 0;
    
    if( currCell.tag == 0 )
        currCell.accessoryType = UITableViewCellAccessoryNone;
    else
        currCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    if( currCell.tag == 1 )
        [self.selAttachements addObject:[attachementValues objectAtIndex:[indexPath row]]];
    else
        [self.selAttachements removeObjectAtIndex:[indexPath row] ];
}

@end
