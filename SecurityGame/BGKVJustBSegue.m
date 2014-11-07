//
//  BGKVJustBSegue.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVJustBSegue.h"
#import "BGKVSillyViewController.h"

@implementation BGKVJustBSegue

- (void) perform {
    BGKVSillyViewController *master = self.sourceViewController;
    BGKVLevelViewController *destination = self.destinationViewController;
    
    [master presentFirstController:destination];
}

@end
