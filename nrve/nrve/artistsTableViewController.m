//
//  artistsTableViewController.m
//  nrve
//
//  Created by Nick Macioce on 12/14/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "artistsTableViewController.h"
#import "ArtistPost.h"
#import "artistDetailViewController.h"

@interface artistsTableViewController ()

@end

@implementation artistsTableViewController

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

    NSURL *blogURL = [NSURL URLWithString:@"http://nickmacioce.com/artistData.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.showList = [NSMutableArray array];
    
    NSArray *showListArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *slDictionary in showListArray) {
        ArtistPost *showPost = [ArtistPost showPostWithTitle:[slDictionary objectForKey:@"title"]];
        showPost.thumbnail = [slDictionary objectForKey:@"thumbnail"];
        showPost.genre = [slDictionary objectForKey:@"genre"];
        showPost.description = [slDictionary objectForKey:@"description"];
        showPost.artistURL = [NSURL URLWithString:[slDictionary objectForKey:@"url"]];
        [self.showList addObject:showPost];
    }
    self.navigationController.navigationBar.topItem.title = @"Local Artists";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:(0/255.0) green:(180/255.0) blue:(250/255.0) alpha:1]}];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(0/255.0) green:(180/255.0) blue:(250/255.0) alpha:1];
    self.navigationController.navigationBar.translucent = false;
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
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
    
    ArtistPost *show = [self.showList objectAtIndex:indexPath.row];
    
    //if ( [show.thumbnail isKindOfClass:[NSString class]]) {
      //  NSData *imageData = [NSData dataWithContentsOfURL:show.thumbnailURL];
        //UIImage *image = [UIImage imageWithData:imageData];
        //cell.imageView.image = image;
    //} else {
      //  cell.imageView.image = nil;
    //}
    cell.textLabel.text = show.title;
    cell.detailTextLabel.text = show.genre;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showArtistPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ArtistPost *showPost2 = [self.showList objectAtIndex:indexPath.row];
        [segue.destinationViewController setArtistTitleName:showPost2.title];
        [segue.destinationViewController setGenreName:showPost2.genre];
        [segue.destinationViewController setArtistDescription:showPost2.description];
        [segue.destinationViewController setArtistMainImage:showPost2.thumbnailURL];
    }
}

@end
