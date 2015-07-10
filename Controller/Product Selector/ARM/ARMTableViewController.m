//
//  ARMTableViewController.m
//  Omega Lift Mobile
//
//  Created by Mac Mini on 14-10-23.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "ARMTableViewController.h"
#import "Category.h"
#import "SingleProductViewController.h"
#import "ARMOptionViewController.h"

@interface ARMTableViewController ()

@end

@implementation ARMTableViewController

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
    self.navigationItem.backBarButtonItem.title = @"Back";
    
    self.title =@"ARM";
    
    [self loadProducts];    
    
    //[self sortProductKey];
}

-(void) loadProducts {
    self.prdCategories = [NSMutableArray arrayWithCapacity:2];
    
    NSMutableDictionary *types = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"arm-product-list" ofType:@"plist"]];
    
    NSArray *keys = [types allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^(id str1, id str2){
        return [((NSString *)str1) compare:((NSString *)str2)
                                   options:NSNumericSearch];
    }];
    
    for(id key in sortedKeys) {
        NSMutableDictionary *type = [types objectForKey:key];
        
        Category *c = [[Category alloc] initWithParams:type name:key];
        
        [self.prdCategories addObject: c];
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
    return [self.prdCategories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Category * c = [self.sortedKeys objectAtIndex:[indexPath row]];
    
    Category * c = [self.prdCategories objectAtIndex:[indexPath row]];
    
    cell.backgroundColor = [UIColor clearColor];    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = c.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:201.0f/255.0f blue:52.0f/255.0f alpha:1.0f]; 
    
    return cell;
}


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
    
    Category *c = [self.prdCategories objectAtIndex:[indexPath row]];    
    
    if( [[c subCategories] count] == 1 ) {
        NSArray *arrPrd = [c.subCategories allKeys];
        NSString *p = [arrPrd objectAtIndex:0];
        self.selProduct = c.subCategories[p];
        
        //[self performSegueWithIdentifier: @"armPrd" sender:self];
        UIStoryboard *prdResult = [UIStoryboard storyboardWithName:@"ProductResultStoryboard" bundle:nil];
        SingleProductViewController *initialVC = [prdResult instantiateInitialViewController];
        initialVC.product = [[Product alloc] initWithDict:self.selProduct];
        initialVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self addBackButton:initialVC];
        [self.navigationController pushViewController:initialVC animated:YES];        
    } else {
        self.selCategories = [c subCategories];
        [self performSegueWithIdentifier: @"armOptions" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"armPrd" ]) {
        SingleProductViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"ARM";
        ctrl.product = [[Product alloc] initWithDict:self.selProduct];
        [self addBackButton:ctrl];
    } else if ( [[segue identifier] isEqualToString:@"armOptions" ] ){
        ARMOptionViewController *ctrl = segue.destinationViewController;
        ctrl.title = @"ARM";
        ctrl.categories = self.selCategories;
        [self addBackButton:ctrl];                
    }
}


@end
