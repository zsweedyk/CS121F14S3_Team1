//
//  BGKVCachedController.m
//  SecurityGame
//
//  Created by Guest User on 10/25/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCachedController.h"
#import "UIViewController+CacheKeyAttribute.h"

@interface BGKVCachedController ()

@end

@implementation BGKVCachedController

NSMutableDictionary * _viewControllerCache;

- (void)drainCache
{
    _viewControllerCache = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // If necessary, allocate the static dictionary.
    if (!_viewControllerCache) {
        _viewControllerCache = [NSMutableDictionary dictionary];
    }
    
    NSString * cacheKey = viewController.cacheKey;
    
    // Get the cache key.
    // Defaults to cacheKey property of destination if not provided.
    // cacheKey will be nil if neither is provided.
    if (cacheKey) {
        if (!([_viewControllerCache.allKeys containsObject:cacheKey])) {
            _viewControllerCache[cacheKey] = viewController;
        }
        
        viewController = _viewControllerCache[cacheKey];
    }
    [super setViewControllers:@[viewController] animated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
