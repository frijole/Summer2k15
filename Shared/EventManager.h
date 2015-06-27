//
//  EventManager.h
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventObject.h"

@interface EventManager : NSObject

+ (EventManager *)defaultManager;
- (NSArray *)events;

@end
