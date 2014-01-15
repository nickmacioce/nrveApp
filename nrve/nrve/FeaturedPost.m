//
//  FeaturedPost.m
//  nrve
//
//  Created by Nick Macioce on 1/12/14.
//  Copyright (c) 2014 Nick Macioce. All rights reserved.
//

#import "FeaturedPost.h"

@implementation FeaturedPost

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if ( self ){
        self.title = title;
        self.thumbnail = nil;
    }
    
    return self;
}

+ (id) showPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) thumbnailURL {
    return [NSURL URLWithString:self.thumbnail];
}

- (NSURL *) thumbnailURL2 {
    return [NSURL URLWithString:self.thumbnail2];
}

@end
