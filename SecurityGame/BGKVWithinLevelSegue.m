//
//  BGKVWithinLevelSegue.m
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVWithinLevelSegue.h"
#import "BGKVLevelViewController.h"
#import "BGKVLevelContainer.h"

@implementation BGKVWithinLevelSegue

- (void) perform
{
    NSLog(@"Doing segue...");
    BGKVLevelViewController *source = self.sourceViewController;
    BGKVLevelContainer *container = source.levelContainer;
    
    NSLog(@"Container: %@", container);
    
    BGKVLevelViewController *destination = self.destinationViewController;
    
    [container showLevelViewController:destination];
    NSLog(@"Done.");
}

@end
