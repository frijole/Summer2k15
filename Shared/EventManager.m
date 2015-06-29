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

// current event cache
@property (nonatomic, strong) EventObject *currentEvent;
@property (nonatomic, strong) EventObject *nextEvent;

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

- (EventObject *)currentEvent {
    // if we dont' have one, or if its not today...
    if ( !_currentEvent || ![[NSCalendar currentCalendar] isDateInToday:_currentEvent.startTime] ) {
        // find event that is today
        NSPredicate *tmpTodayPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return ( [evaluatedObject respondsToSelector:@selector(startTime)] && [[NSCalendar currentCalendar] isDateInToday:[(EventObject *)evaluatedObject startTime]] );
        }];
        NSArray *tmpEventsToday = [self.events filteredArrayUsingPredicate:tmpTodayPredicate];
        _currentEvent = tmpEventsToday.firstObject;

        // clear the nextevent cache, too
        [self setNextEvent:nil];
    }
    
    return _currentEvent;
}

- (EventObject *)nextEvent {
    if ( !_nextEvent ) {
        // find event after the currentEvent
        EventObject *tmpCurrentEvent = [self currentEvent];
        if ( tmpCurrentEvent && tmpCurrentEvent != self.events.lastObject ) {
            // we have a current event, and its not the last one. find the next one
            NSInteger tmpCurrentEventIndex = [self.events indexOfObject:tmpCurrentEvent];
            _nextEvent = [self.events objectAtIndex:tmpCurrentEventIndex+1];
        }
    }
    
    return _nextEvent;
}



@end
