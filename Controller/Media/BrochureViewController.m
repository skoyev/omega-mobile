//
//  BrocureViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-14.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "BrochureViewController.h"
#import "ProductGalleryViewController.h"

@interface BrochureViewController ()

@end

@implementation BrochureViewController

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
    [self loadTypes];
    self.title = @"Brochure";
}

-(void) loadTypes {
    types = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-types" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[types allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableDictionary *d = nil;
    if( section == 0 )
        d = [types objectForKey:@"VM"];
    else if( section == 1 )
        d = [types objectForKey:@"ARM"];
    else if( section == 2)
        d = [types objectForKey:@"4DML"];
    
    return [[d objectForKey:@"series"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *bySerie       = @"VM";
    //NSString *serie         = nil;
    //NSArray  *series        = nil;
    NSDictionary *seriesDic = nil;
    
 if( indexPath.section == 1 ) {
     bySerie = @"ARM";
    } else if( indexPath.section == 2 ) {
     bySerie = @"4DML";
    }
    
    //series    = [[[types objectForKey:bySerie] objectForKey:@"series"] allKeys];
    //serie     = [series objectAtIndex:[indexPath row]];
    seriesDic = [[types objectForKey:bySerie] objectForKey:@"series"];
    
    cell.textLabel.text = [self findSerieByIndex:(int)[indexPath row]:seriesDic];
    //cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];    
    
    return cell;
}

-(NSString *) findSerieByIndex:(int) row : (NSDictionary *) series {
    for(id key in [series allKeys]) {
        NSDictionary *ser = [series objectForKey:key];
        NSString *order = [ser objectForKey:@"order"];
        if( [order intValue] == (int)row ){
            return key;
        }
    }
    
    return @"";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:16]];
    label.backgroundColor = [UIColor clearColor];
    //NSString *string =[list objectAtIndex:section];
    /* Section header is in 0th index... */
    
    if( section == 0 )
        label.text = @"VERTICAL MAST";
    else if ( section == 1 )
        label.text = @"ARM Telehander";
    else if ( section == 2 )
        label.text = @"4D Multiloader";
    
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:0.882 green:0.918 blue:0.392 alpha:1]]; //your background color...
    return view;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableDictionary *d = nil;
    if( [indexPath section] == 0 ) {
        d = [types objectForKey:@"VM"];
    } else if( indexPath.section == 1 ) {
        d = [types objectForKey:@"ARM"];
    } else if( indexPath.section == 2 ) {
        d = [types objectForKey:@"4DML"];
    }
    
    //NSArray *series  = [[d objectForKey:@"series"] allKeys];
    //selSerie         = [series objectAtIndex:[indexPath row]];
    //self.selSerieDic = [[d objectForKey:@"series"] objectForKey:selSerie];
    
    self.selSerieDic = [self findSerieByOrderID:(int)[indexPath row] : [d objectForKey:@"series"]];
    selSerie = [self.selSerieDic objectForKey:@"serie"];
    
    [self performSegueWithIdentifier: @"prdGallery" sender:self];
}

-(NSMutableDictionary *) findSerieByOrderID:(int) rowNum : (NSMutableDictionary *) series {
    for(id key in [series allKeys]) {
        NSMutableDictionary *ser = [series objectForKey:key];
        NSString *order = [ser objectForKey:@"order"];
        if( [order intValue] == rowNum ){
            return ser;
        }
    }
    
    return nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier] isEqualToString:@"prdGallery" ]) {
        ProductGalleryViewController *ctrl = segue.destinationViewController;
        ctrl.title    = selSerie;
        ctrl.serie    = selSerie;
        ctrl.serieDic = self.selSerieDic;
        [self addBackButton:ctrl];
    } 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
