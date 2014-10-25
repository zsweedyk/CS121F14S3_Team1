//
//  BGKVWithinLevelSegue.m
//  SecurityGame
//
//  Created by Guest User on 10/24/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVWithinLevelSegue.h"
#import "UIViewController+CacheKeyAttribute.h"

@implementation BGKVWithinLevelSegue

static NSMutableDictionary * _viewControllerCache;

+ (void)drainCache
{
    _viewControllerCache = nil;
}


- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    // If necessary, allocate the static dictionary.
    if (!_viewControllerCache) {
        _viewControllerCache = [NSMutableDictionary dictionary];
    }
    
    // Get the cache key.
    // Defaults to cacheKey property of destination if not provided.
    // cacheKey will be nil if neither is provided.
    if (!self.cacheKey) {
        self.cacheKey = destination.cacheKey;
    }
    
    // If neither cacheKey is provided, cacheKey will be nil, and we assume that we do not want to cache.
    if (!self.cacheKey) {
        _destinationWasCached = NO;
        return [super initWithIdentifier:identifier source:source destination:destination];
    }
    // Otherwise, either draw from the cache if available or add to the cache using cacheKey.
    else {
        // Add to the cache if not cached
        _destinationWasCached = YES;
        if (!([_viewControllerCache.allKeys containsObject:self.cacheKey])) {
            _viewControllerCache[self.cacheKey] = destination;
            _destinationWasCached = NO;
        }
        
        // Replace destination with cached controller
        // (If _destinationWasCached = NO, these are the same)
        return [super initWithIdentifier:identifier source:source destination:_viewControllerCache[self.cacheKey]];
    }
}

- (void)perform
{
    // Because we are inside a single level, we don't want to be presented,
    // we want to REPLACE the thing being presented.
    UIViewController *presenter = [self.sourceViewController presentingViewController];
    [presenter dismissViewControllerAnimated:NO completion:^
    {
        [presenter presentViewController:self.destinationViewController animated:NO completion:nil];
    }];
}

@end
