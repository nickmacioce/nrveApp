//
//  FeaturedPost.h
//  nrve
//
//  Created by Nick Macioce on 1/12/14.
//  Copyright (c) 2014 Nick Macioce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeaturedPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *thumbnail2;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSURL *artistURL;


// Dedicated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) showPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;
- (NSURL *) thumbnailURL2;


@end
