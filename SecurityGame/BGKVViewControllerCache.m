//
//  BGKVViewControllerCache.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVViewControllerCache.h"
#import "UIViewController+CacheKeyAttribute.h"

@implementation BGKVViewControllerCache

NSMutableDictionary *_cache;

- (instancetype) init {
    self = [super init];
    if (self) {
        [self resetCache];
    }
    return self;
}

- (void) resetCache {
    _cache = [[NSMutableDictionary alloc] init];
}

- (BOOL) hasRepresentativeForKey:(NSString *)key {
    return [_cache.allKeys containsObject:key];
}

- (UIViewController *) getRepresentativeForController:(UIViewController *)controller {
    NSString *key = [self getKeyForController:controller];
    
    // If key is nil, then we don't want to cache it or use the cache.
    if (! key) {
        return controller;
    }
    
    // If there is not already a representative for this key, set controller to be the rep.
    if (! [self hasRepresentativeForKey:key]) {
        [self setRepresentative:controller forKey:key];
    }
    
    return [self getRepresentativeForKey:key];
}

- (UIViewController *) getRepresentativeForKey:(NSString *)key {
    NSAssert(key, @"Attempted to get representative for nil key: `%@`", key);
    NSAssert([self hasRepresentativeForKey:key], @"No representative for key `%@` found.", key);
    return _cache[key];
}

- (void) setRepresentative:(UIViewController *)controller {
    [self setRepresentative:controller forKey:[self getKeyForController:controller]];
}

- (void) setRepresentative:(UIViewController *)controller forKey:(NSString *)key {
    NSAssert(key, @"Attempted to set this controller as representative for nil key: %@", controller);
    _cache[key] = controller;
}

- (NSString *) getKeyForController:(UIViewController *)controller {
    return controller.cacheKey;
}

@end
