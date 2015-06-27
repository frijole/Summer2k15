//
//  EventObject.m
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "EventObject.h"

@implementation EventObject

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super init] ) {
        // decode properties
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    // encode properties
}

+ (EventObject *)eventFromDictionary:(NSDictionary *)dictionary {
    EventObject *rtnEvent = [[EventObject alloc] init];
    
    // update properties
    [rtnEvent setFormattedDate:[dictionary objectForKey:@"date"]];
    [rtnEvent setDetails:[dictionary objectForKey:@"details"]];
    
    return rtnEvent;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<EventObject: %p> (%@)", self, self.formattedDate];
}

@end
