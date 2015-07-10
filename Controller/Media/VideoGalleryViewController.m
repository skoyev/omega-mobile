//
//  VideoGalleryViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-08.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "VideoGalleryViewController.h"
#import "WatchVideoViewController.h"

@interface VideoGalleryViewController ()

@end

@implementation VideoGalleryViewController

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
    self.title = @"Video Gallery";
    
    series = [NSMutableArray arrayWithCapacity:10];
    
    [self loadSeries];
}

-(void) loadSeries {
    types = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-types" ofType:@"plist"]];
    NSArray *keys = [types allKeys];
    for(id key in keys){
        NSMutableDictionary *d = [types objectForKey:key];
        NSMutableDictionary *serie = [d objectForKey:@"series"];
        for(id s in [serie allKeys]){
            NSMutableDictionary *o = [serie objectForKey:s];
            [series addObject: o];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [series count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSMutableDictionary *serie = [series objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [serie objectForKey:@"serie"];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableDictionary *serie = [series objectAtIndex:[indexPath row]];
    
    selectedVideoId = [serie objectForKey:@"videoid"];
    selectedSerie   = [serie objectForKey:@"serie"];
    
    [self performSegueWithIdentifier: @"watchVideo" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WatchVideoViewController *watchCtrl  = segue.destinationViewController;
    watchCtrl.videoId = selectedVideoId;
    watchCtrl.title   = selectedSerie;
    [self addBackButton:watchCtrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
