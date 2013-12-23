//
//  ShowPost.h
//  nrve
//
//  Created by Nick Macioce on 12/03/13.
//  Copyright (c) 2013 Nick Macioce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *withGuests;
@property (nonatomic, strong) NSString *venue;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *eventDetails;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *formattedDate;


// Dedicated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) showPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;

- (NSString *) formattedDate;

@end
