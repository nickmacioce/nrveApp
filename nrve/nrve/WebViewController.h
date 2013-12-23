//
//  WebViewController.h
//  nrve
//
//  Created by Nick Macioce on 12/03/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *showPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
