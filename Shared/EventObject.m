//
//  EventObject.m
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "EventObject.h"

static NSDateFormatter *_eventDateFormatter = nil;

@implementation EventObject

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super init] ) {
        // decode properties
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.details = [aDecoder decodeObjectForKey:@"details"];
        self.formattedDate = [aDecoder decodeObjectForKey:@"formattedDate"];
        self.startTime = [aDecoder decodeObjectForKey:@"startTime"];
        self.endTime = [aDecoder decodeObjectForKey:@"endTime"];
        self.location = [aDecoder decodeObjectForKey:@"location"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    // encode properties
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.details forKey:@"details"];
    [aCoder encodeObject:self.formattedDate forKey:@"formattedDate"];
    [aCoder encodeObject:self.startTime forKey:@"startTime"];
    [aCoder encodeObject:self.endTime forKey:@"endTime"];
    [aCoder encodeObject:self.location forKey:@"location"];
}

+ (EventObject *)eventFromDictionary:(NSDictionary *)dictionary {
    EventObject *rtnEvent = [[EventObject alloc] init];
    
    // update properties
    [rtnEvent setFormattedDate:[dictionary objectForKey:@"date"]];
    // "Saturday, June 20"
    NSString *tmpDateString = rtnEvent.formattedDate;
    if ( tmpDateString && tmpDateString.length > 0 ) {
        tmpDateString = [[tmpDateString componentsSeparatedByString:@", "] lastObject];
        NSDate *tmpUnformattedDate = [[self eventDateFormatter] dateFromString:tmpDateString];
        if ( tmpUnformattedDate ) {
            NSDateComponents *tmpStartTimeComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:tmpUnformattedDate];
            [tmpStartTimeComponents setYear:2015];
            [tmpStartTimeComponents setHour:17]; // 5 pm for now
            NSDate *tmpStartTime = [[NSCalendar currentCalendar] dateFromComponents:tmpStartTimeComponents];
            [rtnEvent setStartTime:tmpStartTime];
        } else {
            NSLog(@"failed to decode date from string: \"%@\"", tmpDateString);
        }
    } else {
        NSLog(@"no formatted date to parse");
    }
    
    [rtnEvent setTitle:[dictionary objectForKey:@"title"]];
    [rtnEvent setDetails:[dictionary objectForKey:@"details"]];
    [rtnEvent setLocation:[dictionary objectForKey:@"location"]];
    
    return rtnEvent;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<EventObject: %p> (%@)", self, self.formattedDate];
}

+ (NSDateFormatter *)eventDateFormatter {
    if ( !_eventDateFormatter ) {
        _eventDateFormatter = [[NSDateFormatter alloc] init];
        [_eventDateFormatter setDateFormat:@"MMMM d"];
    }
    return _eventDateFormatter;
}

@end
