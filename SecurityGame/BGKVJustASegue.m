//
//  BGKVJustASegue.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVJustASegue.h"
#import "BGKVLevelViewController.h"
#import "BGKVSillyViewController.h"

@implementation BGKVJustASegue

- (void) perform {
    BGKVLevelViewController* source = self.sourceViewController;
    BGKVSillyViewController *master = source.levelMaster;
    BGKVLevelViewController* destination = self.destinationViewController;
    
    [master moveToNewController:destination];
}

@end
