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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[EventManager defaultManager] events] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *rtnCell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    EventObject *tmpEvent = [[[EventManager defaultManager] events] objectAtIndex:indexPath.row];
    // TODO: update cell with info
    [rtnCell.textLabel setText:tmpEvent.formattedDate];
    [rtnCell.detailTextLabel setText:tmpEvent.details];
    return rtnCell;
}

@end
