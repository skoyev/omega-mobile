//
//  WatchVideoViewController.m
//  OML Mobile
//
//  Created by Mac Mini on 14-12-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import "WatchVideoViewController.h"

@interface WatchVideoViewController ()

@end

@implementation WatchVideoViewController

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
    
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height + 60)];
    
    bgImage.image = [UIImage imageNamed:@"home_background.png"];
    
    [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    
    [self.activityInd startAnimating];
    self.activityInd.hidesWhenStopped = YES;

	// Do any additional setup after loading the view.
    [self playVideoWithId];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityInd stopAnimating];
}

- (void)playVideoWithId {
    self.webView.backgroundColor = [UIColor clearColor];
    
    self.webView.opaque = NO;
    
    self.webView.mediaPlaybackRequiresUserAction = NO;
    
    NSString* url = [NSString stringWithFormat:@"https://www.youtube.com/embed/%@", self.videoId];
    
    NSURL* nsUrl = [NSURL URLWithString:url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
