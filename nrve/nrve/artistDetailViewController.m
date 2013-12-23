//
//  artistDetailViewController.m
//  nrve
//
//  Created by Nick Macioce on 12/14/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "artistDetailViewController.h"

@interface artistDetailViewController ()

@end

@implementation artistDetailViewController

@synthesize artistTitle;
@synthesize artistTitleName;
@synthesize genreName;
@synthesize genreTitle;
@synthesize artistDescription;
@synthesize mainDescription;
@synthesize artistMainImage;
@synthesize artistImageView;

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
    NSString *artistName = self.artistTitleName;
    NSString *genreText = self.genreName;
    NSString *mainInfo = self.artistDescription;
    NSURL *mainImage = self.artistMainImage;
    genreTitle.text = genreText;
    artistTitle.text = artistName;
    mainDescription.text = mainInfo;
            
    if (mainImage == NULL) {
        artistImageView.image = [UIImage imageNamed:@"SteelersBW.jpg"];
    } else {
        NSData *imageData = [NSData dataWithContentsOfURL:mainImage];
        UIImage *image = [UIImage imageWithData:imageData];
        artistImageView.image = image;
    }
    
    
    
    
   
   
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
