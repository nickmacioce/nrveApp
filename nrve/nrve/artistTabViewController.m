//
//  artistTabViewController.m
//  nrve
//
//  Created by Nick Macioce on 1/11/14.
//  Copyright (c) 2014 Nick Macioce. All rights reserved.
//

#import "artistTabViewController.h"
#import "ArtistPost.h"
#import "artistDetailViewController.h"
#import "FeaturedPost.h"

@interface artistTabViewController ()

@end

@implementation artistTabViewController

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
        ArtistPost *featuredPost = [ArtistPost showPostWithTitle:[slDictionary objectForKey:@"title"]];
        featuredPost.thumbnail = [slDictionary objectForKey:@"thumbnail"];
        featuredPost.genre = [slDictionary objectForKey:@"genre"];
        featuredPost.description = [slDictionary objectForKey:@"description"];
        featuredPost.artistURL = [NSURL URLWithString:[slDictionary objectForKey:@"url"]];
        [self.featuredList addObject:featuredPost];
    }
    
    FeaturedPost *fpost = [self.featuredList objectAtIndex:0];
    
    
    if ( [fpost.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:fpost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        [self.featuredButton setBackgroundImage:image forState:UIControlStateNormal];
    }

    self.navigationController.navigationBar.topItem.title = @"Local Artists";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
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
        //NSData *imageData = [NSData dataWithContentsOfURL:show.thumbnailURL];
        //UIImage *image = [UIImage imageWithData:imageData];
        //cell.backgroundView = [[UIImageView alloc]initWithImage:image];
        //} else {
        //  cell.imageView.image = nil;
    //}
    
    cell.textLabel.text = show.title;
    cell.detailTextLabel.text = show.genre;
    
    return cell;
}


-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return 60;
}

@end
