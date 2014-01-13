//
//  artistTabViewController.h
//  nrve
//
//  Created by Nick Macioce on 1/11/14.
//  Copyright (c) 2014 Nick Macioce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface artistTabViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *showList;
@property (nonatomic, strong) NSMutableArray *featuredList;
@property (strong, nonatomic) IBOutlet UIButton *featuredButton;


@end
