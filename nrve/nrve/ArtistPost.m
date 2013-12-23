//
//  ArtistPost.m
//  nrve
//
//  Created by Nick Macioce on 12/14/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "ArtistPost.h"

@implementation ArtistPost

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

@end
