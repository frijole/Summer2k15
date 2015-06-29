//
//  InterfaceController.h
//  Summer2k15 WatchKit Extension
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (nonatomic, weak) IBOutlet WKInterfaceLabel *titleLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *timeLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *locationLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *detailLabel;

@end

@interface CurrentEventInterfaceController : InterfaceController

@end

@interface NextEventInterfaceController : InterfaceController

@end
