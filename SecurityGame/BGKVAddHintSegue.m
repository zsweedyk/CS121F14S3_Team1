//
//  BGKVAddHintSegue.m
//  SecurityGame
//
//  Created by Guest User on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVAddHintSegue.h"
#import "BGKVLevelViewController.h"
#import "BGKVLevelContainer.h"

@implementation BGKVAddHintSegue

- (void)perform
{
    BGKVLevelViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    [source.levelContainer addNewHintWithController:destination];
}

@end
