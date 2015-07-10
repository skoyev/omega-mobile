//
//  WatchVideoViewController.h
//  OML Mobile
//
//  Created by Mac Mini on 14-12-17.
//  Copyright (c) 2014 Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WatchVideoViewController : UIViewController<UIWebViewDelegate> {
}

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

@property (copy, nonatomic)   NSString *videoId;

@end
