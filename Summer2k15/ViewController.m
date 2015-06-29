//
//  ViewController.m
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "ViewController.h"
#import "EventManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    EventObject *tmpCurrentEvent = [[EventManager defaultManager] currentEvent];
    NSInteger tmpCurrentEventIndex = [[[EventManager defaultManager] events] indexOfObject:tmpCurrentEvent];
    NSIndexPath *tmpCurrentEventIndexPath = [NSIndexPath indexPathForRow:tmpCurrentEventIndex inSection:0];
    // [self.tableView selectRowAtIndexPath:tmpIndexPathToSelect animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self.tableView scrollToRowAtIndexPath:tmpCurrentEventIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[EventManager defaultManager] events] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *rtnCell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    
    // update cell with info
    EventObject *tmpEvent = [[[EventManager defaultManager] events] objectAtIndex:indexPath.row];
    [rtnCell.textLabel setText:tmpEvent.formattedDate];
    [rtnCell.detailTextLabel setText:tmpEvent.title];

    if ( [tmpEvent isEqual:[[EventManager defaultManager] currentEvent]] ) {
        [rtnCell setBackgroundColor:[UIColor orangeColor]];
    } else {
        [rtnCell setBackgroundColor:[UIColor whiteColor]];
    }

    return rtnCell;
}

@end
