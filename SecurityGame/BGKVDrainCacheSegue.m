//
//  BGKVDrainCacheSegue.m
//  SecurityGame
//
//  Created by Guest User on 10/25/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVDrainCacheSegue.h"
#import "BGKVCachedController.h"

@implementation BGKVDrainCacheSegue

- (void) perform
{
    UIViewController * source = self.sourceViewController;
    [(BGKVCachedController *)(source.navigationController) drainCache];
    [source.navigationController pushViewController:self.destinationViewController animated:YES];
}

@end
