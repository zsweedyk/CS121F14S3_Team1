//
//  BGKVLevelViewControllerCache.h
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGKVLevelViewController;

@interface BGKVLevelViewControllerCache : NSObject

- (void)resetCache;

- (BOOL)hasRepresentativeForKey:(NSString *)key;

- (BGKVLevelViewController *)representativeForController:(BGKVLevelViewController *)controller;

- (BGKVLevelViewController *)representativeForKey:(NSString *)key;

- (void)setRepresentativeForController:(BGKVLevelViewController *)controller;

- (void)setRepresentative:(BGKVLevelViewController *)controller forKey:(NSString *)key;

- (NSString *)keyForController:(BGKVLevelViewController *)controller;

@end
