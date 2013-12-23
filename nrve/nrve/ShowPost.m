//
//  ShowPost.m
//  nrve
//
//  Created by Nick Macioce on 12/03/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import "ShowPost.h"

@implementation ShowPost

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if ( self ){
        self.title = title;
        self.venue = nil;
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

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    
    [dateFormatter setDateFormat:@"EEE MMM, dd"];
    return [dateFormatter stringFromDate:tempDate];

}



@end
