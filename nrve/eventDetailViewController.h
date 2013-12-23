//
//  eventDetailViewController.h
//  nrve
//
//  Created by Nick Macioce on 12/22/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eventDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *eventHeaderTitle;
@property (strong, nonatomic) IBOutlet UILabel *withGuestsLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventDetailsLabel;

@property (strong, nonatomic) NSString *eventHeader;
@property (strong, nonatomic) NSString *withGuestsText;
@property (strong, nonatomic) NSString *venueText;
@property (strong, nonatomic) NSString *dateText;
@property (strong, nonatomic) NSString *timeText;
@property (strong, nonatomic) NSString *eventDetailsText;
@property (strong, nonatomic) NSURL *eventURL;

@end
