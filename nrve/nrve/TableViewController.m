//
//  TableViewController.m
//  nrve
//
//  Created by Nick Macioce on 12/03/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "WebViewController.h"
#import "TableViewController.h"
#import "ShowPost.h"
#import "eventDetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
    
        
    NSURL *blogURL = [NSURL URLWithString:@"http://nickmacioce.com/showData.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
   
    self.showList = [NSMutableArray array];
    
    NSArray *showListArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *slDictionary in showListArray) {
        ShowPost *showPost = [ShowPost showPostWithTitle:[slDictionary objectForKey:@"title"]];
        showPost.venue = [slDictionary objectForKey:@"venue"];
        showPost.withGuests = [slDictionary objectForKey:@"withGuests"];
        showPost.time = [slDictionary objectForKey:@"time"];
        showPost.date = [slDictionary objectForKey:@"date"];
        showPost.eventDetails = [slDictionary objectForKey:@"eventDetails"];
        showPost.thumbnail = [slDictionary objectForKey:@"thumbnail"];
        showPost.url = [NSURL URLWithString:[slDictionary objectForKey:@"url"]];
        [self.showList addObject:showPost];
    }
    self.navigationController.navigationBar.topItem.title = @"Upcoming Shows";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(245/255.0) green:(245/255.0) blue:(245/255.0) alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:(0/255.0) green:(180/255.0) blue:(250/255.0) alpha:1]}];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(0/255.0) green:(180/255.0) blue:(250/255.0) alpha:1];
    self.navigationController.navigationBar.translucent = false;
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:(244/255.0) green:(244/255.0) blue:(244/255.0) alpha:1];
    self.tabBarController.tabBar.translucent = false;
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

    return [self.showList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ShowPost *show = [self.showList objectAtIndex:indexPath.row];

    if ( [show.thumbnail isKindOfClass:[NSString class]]) {
    NSData *imageData = [NSData dataWithContentsOfURL:show.thumbnailURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"m7Icon@2x.png"];
    }
    cell.textLabel.text = show.title;
    cell.detailTextLabel.text = show.date;

    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showEventDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ShowPost *showPost2 = [self.showList objectAtIndex:indexPath.row];
        [segue.destinationViewController setEventHeader:showPost2.title];
        [segue.destinationViewController setWithGuestsText:showPost2.withGuests];
        [segue.destinationViewController setVenueText:showPost2.venue];
        [segue.destinationViewController setDateText:showPost2.date];
        [segue.destinationViewController setTimeText:showPost2.time];
        [segue.destinationViewController setEventDetailsText:showPost2.eventDetails];
        [segue.destinationViewController setEventURL:showPost2.url];
        
    }
}

@end
