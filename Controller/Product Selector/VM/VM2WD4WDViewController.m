//
//  VM2WD4WDViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "VM2WD4WDViewController.h"
#import "Category.h"
#import "VM2WS4WSViewController.h"
#import "VM2WDCapacityViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VM2WD4WDViewController ()

@end

@implementation VM2WD4WDViewController

@synthesize categories, selSubCategories;

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
    
    self.title = @"Vertical Mast";
    self.navigationItem.backBarButtonItem.title = @"Back";
    
    [self loadCategories];    
}

-(void) loadCategories {
    self.categories = [NSMutableArray arrayWithCapacity:2];
    
    NSMutableDictionary *types = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vm-product-list" ofType:@"plist"]];
    
    for(id key in types) {
        NSMutableDictionary *type = [types objectForKey:key];

        Category *c = [[Category alloc] initWithParams:type name:key];
        
        [self.categories addObject: c];
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
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Category * c = [self.categories objectAtIndex:[indexPath row]];
    cell.textLabel.text = c.name;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    /*
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor yellowColor];
    bgColorView.layer.cornerRadius = 10;
    [cell setSelectedBackgroundView:bgColorView];
     */
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(20, 0, tableView.frame.size.width, 80.0)];
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
    return 80.0;
}

/*
- (UIView *) tableview:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,20)];
    [customLabel setText:@"Choose one of the following options:"];
    
    return customLabel;
}
 */

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Choose one of the following options:";
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
    
    Category *c = [self.categories objectAtIndex:[indexPath row]];
    
    self.selSubCategories = c.subCategories;
    
    [self performSegueWithIdentifier: [c.name isEqualToString:@"2WD"] ? @"vm2wdcapacity" : @"vm2ws4ws" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"vm2wdcapacity" ]) {
        VM2WS4WSViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"Vertical Mast";
        ctrl.categories = self.selSubCategories;
        [self addBackButton:ctrl];
    } else if ( [[segue identifier] isEqualToString:@"vm2ws4ws" ] ){
        VM2WDCapacityViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"Vertical Mast";
        ctrl.categories = self.selSubCategories;
        [self addBackButton:ctrl];
    }
}

@end
