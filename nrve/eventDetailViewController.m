//
//  eventDetailViewController.m
//  nrve
//
//  Created by Nick Macioce on 12/22/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "eventDetailViewController.h"
#import "ShowPost.h"
#import "WebViewController.h"

@interface eventDetailViewController ()

@end

@implementation eventDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *eventHeaderText = self.eventHeader;
    NSString *withGuests = self.withGuestsText;
    NSString *venue = self.venueText;
    NSString *date = self.dateText;
    NSString *time = self.timeText;
    NSString *eventDetails = self.eventDetailsText;
    
    self.eventHeaderTitle.text = eventHeaderText;
    self.withGuestsLabel.text = withGuests;
    self.venueLabel.text = venue;
    self.dateLabel.text = date;
    self.timeLabel.text = time;
    self.eventDetailsLabel.text = eventDetails;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showShowPost"]){
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //ShowPost *showPost2 = [self.showList objectAtIndex:indexPath.row];
        //[segue.destinationViewController setShowPostURL:showPost2.url];
        [segue.destinationViewController setShowPostURL:self.eventURL];
    }
}

@end
