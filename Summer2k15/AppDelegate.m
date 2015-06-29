//
//  AppDelegate.m
//  Summer2k15
//
//  Created by Ian Meyer on 6/19/15.
//  Copyright (c) 2015 Ian Meyer. All rights reserved.
//

#import "AppDelegate.h"
#import "EventManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply {
    NSDictionary *replyDictionary = nil;
    
    if ( [[userInfo objectForKey:@"request"] isEqual:@"events"] ) {
        replyDictionary = @{@"events":[NSKeyedArchiver archivedDataWithRootObject:[[EventManager defaultManager] events]]};
    }
    else if ( [[userInfo objectForKey:@"request"] isEqual:@"currentEvent"] ) {
        replyDictionary = @{@"currentEvent":[NSKeyedArchiver archivedDataWithRootObject:[[EventManager defaultManager] currentEvent]]};
    }
    else if ( [[userInfo objectForKey:@"request"] isEqual:@"nextEvent"] ) {
        replyDictionary = @{@"nextEvent":[NSKeyedArchiver archivedDataWithRootObject:[[EventManager defaultManager] nextEvent]]};
    }
    
    reply(replyDictionary);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
