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
    BGKVLevelViewController *source = self.sourceViewController;
    BGKVLevelContainer *container = source.levelContainer;
    
    BGKVLevelViewController *destination = self.destinationViewController;
    
    [container showLevelViewController:destination];
}

@end
