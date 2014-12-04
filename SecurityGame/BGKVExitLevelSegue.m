//
//  BGKVExitLevelSegue.m
//  SecurityGame
//
//  Created by Guest User on 11/11/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVExitLevelSegue.h"
#import "BGKVLevelViewController.h"
#import "BGKVLevelContainer.h"

@implementation BGKVExitLevelSegue

- (void) perform
{
    BGKVLevelViewController *source = self.sourceViewController;
    BGKVLevelContainer *container = source.levelContainer;
    
    UIViewController *destination = self.destinationViewController;
    

    [container presentViewController:destination animated:YES completion:nil];
    [container reset];
}

@end
