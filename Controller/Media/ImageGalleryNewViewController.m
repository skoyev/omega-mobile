//
//  ImageGelleryNewViewController.m
//  OML Mobile
//
//  Created by mac user on 2015-07-05.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

#import "ImageGalleryNewViewController.h"
#import "ImageGalleryBySerieViewController.h"

@interface ImageGalleryNewViewController ()

@end

@implementation ImageGalleryNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadTypes];
    self.title = @"Image Gallery";
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
    NSDictionary *seriesDic = nil;
    
    if( indexPath.section == 1 ) {
        bySerie = @"ARM";
    } else if( indexPath.section == 2 ) {
        bySerie = @"4DML";
    }
    
    seriesDic = [[types objectForKey:bySerie] objectForKey:@"series"];
    
    cell.textLabel.text = [self findSerieByIndex:(int)[indexPath row]:seriesDic];
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
    
    self.selSerieDic = [self findSerieByOrderID:(int)[indexPath row] : [d objectForKey:@"series"]];
    selSerie = [self.selSerieDic objectForKey:@"serie"];
    
    [self performSegueWithIdentifier: @"imageGalBySerie" sender:self];
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
    ImageGalleryBySerieViewController *ctrl = segue.destinationViewController;
    ctrl.title         = selSerie;
    ctrl.serie         = self.selSerieDic;
    [self addBackButton:ctrl];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
