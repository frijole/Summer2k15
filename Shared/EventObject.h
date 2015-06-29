//
//  EventObject.h
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface EventObject : NSObject <NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *details;

@property (nonatomic, copy) NSString *formattedDate;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

//@property (nonatomic, copy) NSString *linkTitle;
//@property (nonatomic, copy) NSURL *linkURL;

//@property (nonatomic, copy) NSURL *imageURL;
//@property (nonatomic, strong) UIImage *image;

@property (nonatomic) NSString *location;

+ (EventObject *)eventFromDictionary:(NSDictionary *)dictionary;

@end
