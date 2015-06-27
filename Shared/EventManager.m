//
//  EventManager.m
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "EventManager.h"

static EventManager *_defaultManager = nil;

@interface EventManager ()

@property (nonatomic, strong) NSArray *events;

@end

@implementation EventManager

+ (EventManager *)defaultManager {
    if ( !_defaultManager ) {
        _defaultManager = [[EventManager alloc] init];
    }
    return _defaultManager;
}

- (NSArray *)events {
    if ( !_events ) {
        NSString *tmpPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
        NSObject *tmpObjectFromDisk = [NSArray arrayWithContentsOfFile:tmpPath];
        if ( tmpObjectFromDisk && [tmpObjectFromDisk isKindOfClass:[NSArray class]] ) {
            NSArray *tmpEventsFromDisk = (NSArray *)tmpObjectFromDisk;
            NSArray *tmpEventsToUse = @[];
            for ( NSDictionary *tmpEventDictionary in tmpEventsFromDisk ) {
                EventObject *tmpEventObject = [EventObject eventFromDictionary:tmpEventDictionary];
                if ( tmpEventObject ) {
                    tmpEventsToUse = [tmpEventsToUse arrayByAddingObject:tmpEventObject];
                } else {
                    NSLog(@"failed to create event from dictionary: %@", tmpEventDictionary);
                }
            }
            _events = [NSArray arrayWithArray:tmpEventsToUse];
        }
    }
    
    return _events;
}

@end
