//
//  VM2WS4WSViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-09-24.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "VM2WS4WSViewController.h"
#import "Category.h"
#import "VM2WSViewController.h"
#import "VM4WSViewController.h"

@interface VM2WS4WSViewController ()

@end

@implementation VM2WS4WSViewController

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
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *k = [self.sortedKeys objectAtIndex:[indexPath row]];

    cell.textLabel.text = k;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell...
    
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [self.sortedKeys objectAtIndex:[indexPath row]];
    
    self.selSubCategories = [self.categories objectForKey:key ];
    
    //NSLog(@"%@", key);
    
    //NSMutableDictionary *prd = [self.categories objectForKey:key ];
    
    //NSLog(@"%@", prd);
    
    //NSArray *arrPrd = [prd allKeys];
    
    //NSString *p = [arrPrd objectAtIndex:0];
    
    //self.selSubCategories = prd[p];
    
    [self performSegueWithIdentifier: [key isEqualToString:@"2 Wheel Steer"] ? @"vm2ws" : @"vm4ws" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {    
    if( [[segue identifier] isEqualToString:@"vm2ws" ]) {
        VM2WSViewController *ctrl = segue.destinationViewController;
        //ctrl.title = @"Vertical Mast";
        ctrl.title = @"VM Maximum Capacity (lbs)";        
        ctrl.categories = self.selSubCategories;
        [self addBackButton:ctrl];
    } else if ( [[segue identifier] isEqualToString:@"vm4ws" ] ){
        VM4WSViewController *ctrl = segue.destinationViewController;
        //ctrl.title = @"Vertical Mast";
        ctrl.title = @"VM Maximum Capacity (lbs)";
        ctrl.categories = self.selSubCategories;
        [self addBackButton:ctrl];        
    }    
}


@end
