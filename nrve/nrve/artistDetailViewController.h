//
//  artistDetailViewController.h
//  nrve
//
//  Created by Nick Macioce on 12/14/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface artistDetailViewController : UIViewController

@property (strong, nonatomic) NSString *artistTitleName;
@property (strong, nonatomic) NSString *genreName;
@property (strong, nonatomic) NSString *artistDescription;
@property (strong, nonatomic) NSURL *artistMainImage;
@property (strong, nonatomic) IBOutlet UILabel *artistTitle;
@property (strong, nonatomic) IBOutlet UILabel *genreTitle;
@property (strong, nonatomic) IBOutlet UIImageView *artistImageView;
@property (strong, nonatomic) IBOutlet UITextView *mainDescription;



@end
