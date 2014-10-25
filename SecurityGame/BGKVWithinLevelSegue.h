//
//  BGKVWithinLevelSegue.h
//  SecurityGame
//
//  Created by Guest User on 10/24/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVWithinLevelSegue : UIStoryboardSegue

+ (void)drainCache;

@property (nonatomic, readonly) BOOL destinationWasCached;

@property (nonatomic, readwrite) NSString* cacheKey;

@end
