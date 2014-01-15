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
#import "FeaturedPost.h"

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
    NSURL *blogURL = [NSURL URLWithString:@"http://nickmacioce.com/artistData.json"];
    NSURL *featuredURL = [NSURL URLWithString:@"http://nickmacioce.com/featuredData.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSData *featuredData = [NSData dataWithContentsOfURL:featuredURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSDictionary *featuredDictionary = [NSJSONSerialization JSONObjectWithData:featuredData options:0 error:&error];
    
    self.showList = [NSMutableArray array];
    self.featuredList = [NSMutableArray array];
    
    NSArray *showListArray = [dataDictionary objectForKey:@"posts"];
    NSArray *featuredListArray = [featuredDictionary objectForKey:@"posts"];
    
    for (NSDictionary *slDictionary in showListArray) {
        ArtistPost *showPost = [ArtistPost showPostWithTitle:[slDictionary objectForKey:@"title"]];
        showPost.thumbnail = [slDictionary objectForKey:@"thumbnail"];
        showPost.genre = [slDictionary objectForKey:@"genre"];
        showPost.description = [slDictionary objectForKey:@"description"];
        showPost.artistURL = [NSURL URLWithString:[slDictionary objectForKey:@"url"]];
        [self.showList addObject:showPost];
    }
    
    for (NSDictionary *slDictionary in featuredListArray) {
        FeaturedPost *featuredPost = [FeaturedPost showPostWithTitle:[slDictionary objectForKey:@"title"]];
        featuredPost.thumbnail = [slDictionary objectForKey:@"thumbnail"];
        featuredPost.thumbnail2 = [slDictionary objectForKey:@"thumbnail2"];
        featuredPost.genre = [slDictionary objectForKey:@"genre"];
        featuredPost.description = [slDictionary objectForKey:@"description"];
        featuredPost.artistURL = [NSURL URLWithString:[slDictionary objectForKey:@"url"]];
        [self.featuredList addObject:featuredPost];
    }
    
    self.navigationController.navigationBar.topItem.title = @"Local Artists";
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
    
    if (indexPath.row == 0) {
        FeaturedPost *fArtist = [self.featuredList objectAtIndex:indexPath.row];
        NSData *imageData = [NSData dataWithContentsOfURL:fArtist.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.backgroundView = [[UIImageView alloc] initWithImage:image];
        cell.textLabel.text = nil;
        cell.detailTextLabel.text = nil;
    }else{
        ArtistPost *show = [self.showList objectAtIndex:indexPath.row];
        cell.textLabel.text = show.title;
        cell.detailTextLabel.text = show.genre;
    }
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showArtistPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if (indexPath.row == 0){
            FeaturedPost *showPost2 = [self.showList objectAtIndex:indexPath.row];
            [segue.destinationViewController setArtistTitleName:showPost2.title];
            [segue.destinationViewController setGenreName:showPost2.genre];
            [segue.destinationViewController setArtistDescription:showPost2.description];
            [segue.destinationViewController setArtistMainImage:showPost2.thumbnailURL];
        } else {
            ArtistPost *showPost2 = [self.showList objectAtIndex:indexPath.row];
            [segue.destinationViewController setArtistTitleName:showPost2.title];
            [segue.destinationViewController setGenreName:showPost2.genre];
            [segue.destinationViewController setArtistDescription:showPost2.description];
            [segue.destinationViewController setArtistMainImage:showPost2.thumbnailURL];
        }
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
    if (indexPath.row == 0) {
        return 140;
    } else {
        return 65;
    }
}

@end
