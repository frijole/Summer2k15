//
//  InterfaceController.m
//  Summer2k15 WatchKit Extension
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "InterfaceController.h"
#import "EventObject.h"

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end


@implementation CurrentEventInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    BOOL tmpRequestSent = [WKInterfaceController openParentApplication:@{@"request":@"currentEvent"} reply:^(NSDictionary *replyInfo, NSError *error) {
        if ( error ) {
            NSLog(@"error getting current event: %@", error);
        } else {
            EventObject *tmpEvent = [NSKeyedUnarchiver unarchiveObjectWithData:[replyInfo objectForKey:@"currentEvent"]];
            if ( tmpEvent ) {
                [self.titleLabel setText:tmpEvent.title];
                // [self.timeLabel setText:tmpEvent.startTime]; // TODO: format string
                [self.locationLabel setText:tmpEvent.location];
                [self.detailLabel setText:tmpEvent.details];
            }
        }
    }];
    
    NSLog(@"requested current event? %@", tmpRequestSent?@"YES":@"NO");
}

@end


@implementation NextEventInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    BOOL tmpRequestSent = [WKInterfaceController openParentApplication:@{@"request":@"nextEvent"} reply:^(NSDictionary *replyInfo, NSError *error) {
        if ( error ) {
            NSLog(@"error getting current event: %@", error);
        } else {
            EventObject *tmpEvent = [NSKeyedUnarchiver unarchiveObjectWithData:[replyInfo objectForKey:@"nextEvent"]];
            if ( tmpEvent ) {
                [self.titleLabel setText:tmpEvent.title];
                // [self.timeLabel setText:tmpEvent.startTime]; // TODO: format string
                [self.locationLabel setText:tmpEvent.location];
                [self.detailLabel setText:tmpEvent.details];
            }
        }
    }];
    
    NSLog(@"requested next event? %@", tmpRequestSent?@"YES":@"NO");
}


@end