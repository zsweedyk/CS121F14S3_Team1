//
//  BGKVCachedModalSegue.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCachedModalSegue.h"
#import "BGKVViewControllerCache.h"

@implementation BGKVCachedModalSegue

static BGKVViewControllerCache *_cache;

+ (void) drainCache {
    _cache = nil;
}

- (void) perform {
    if (! _cache) {
        _cache = [[BGKVViewControllerCache alloc] init];
    }
    
    UIViewController * source = self.sourceViewController;
    UIViewController * destination = self.destinationViewController;
    
    destination = [_cache getRepresentativeForController:destination];
    
    // Now the actual transition
    
    // In this case, destination is presenting things, and is on the view stack.
    // So, to get to it, just dismiss what it is presenting.
    if ([destination presentedViewController]) {
        [[destination presentedViewController] dismissViewControllerAnimated:YES completion:nil];
    }
    
    // Otherwise, present it.
    else {
        [source presentViewController:destination animated:YES completion:nil];
    }
}

@end
