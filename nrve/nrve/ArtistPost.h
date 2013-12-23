//
//  ArtistPost.h
//  nrve
//
//  Created by Nick Macioce on 12/14/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSURL *artistURL;


// Dedicated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) showPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;


@end
