//
//  BGKVLevelViewControllerCache.m
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewControllerCache.h"
#import "BGKVLevelViewController.h"

@implementation BGKVLevelViewControllerCache

NSMutableDictionary *_cache;

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self resetCache];
    }
    return self;
}

- (void) resetCache
{
    NSLog(@"Resetting, cache:%@", _cache);
    _cache = [[NSMutableDictionary alloc] init];
    NSLog(@"Now cache is:%@", _cache);
}

- (BOOL) hasRepresentativeForKey:(NSString *)key
{
    NSLog(@"Hello");
    NSLog(@"CCache: %@", self);
    NSLog(@"Real cache: %@", _cache);
    NSLog(@"%@", _cache.allKeys);
    return [_cache.allKeys containsObject:key];
}

- (BGKVLevelViewController *) representativeForController:(BGKVLevelViewController *)controller
{
    NSString *key = [self keyForController:controller];
    
    // If key is nil, then we don't want to cache it or use the cache.
    if (! key) {
        return controller;
    }
    
    // If there is not already a representative for this key, set controller to be the rep.
    if (! [self hasRepresentativeForKey:key]) {
        [self setRepresentative:controller forKey:key];
    }
    
    return [self representativeForKey:key];
}

- (BGKVLevelViewController *) representativeForKey:(NSString *)key
{
    NSAssert(key, @"Attempted to get representative for nil key: `%@`", key);
    NSAssert([self hasRepresentativeForKey:key], @"No representative for key `%@` found.", key);
    return _cache[key];
}

- (void) setRepresentativeForController:(BGKVLevelViewController *)controller
{
    [self setRepresentative:controller forKey:[self keyForController:controller]];
}

- (void) setRepresentative:(BGKVLevelViewController *)controller forKey:(NSString *)key
{
    NSAssert(key, @"Attempted to set this controller as representative for nil key: %@", controller);
    _cache[key] = controller;
}

- (NSString *) keyForController:(BGKVLevelViewController *)controller
{
    return controller.cacheKey;
}

@end
