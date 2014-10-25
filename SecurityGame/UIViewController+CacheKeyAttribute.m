//
//  UIViewController+CacheKeyAttribute.m
//  SecurityGame
//
//  Created by Guest User on 10/24/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "UIViewController+CacheKeyAttribute.h"
#import <objc/runtime.h>

@implementation UIViewController (CacheKeyAttribute)
@dynamic cacheKey;

- (void)setCacheKey:(NSString *)cacheKey {
    objc_setAssociatedObject(self, @selector(cacheKey), cacheKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)cacheKey
{
    return (NSString *)objc_getAssociatedObject(self, @selector(cacheKey));
}
@end
