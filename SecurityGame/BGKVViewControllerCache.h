//
//  BGKVViewControllerCache.h
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVViewControllerCache : NSObject

- (void) resetCache;

- (BOOL) hasRepresentativeForKey:(NSString *)key;

- (UIViewController *) getRepresentativeForController:(UIViewController *)controller;

- (UIViewController *) getRepresentativeForKey:(NSString *)key;

- (void) setRepresentative:(UIViewController *)controller;

- (void) setRepresentative:(UIViewController *)controller forKey:(NSString *)key;

- (NSString *) getKeyForController:(UIViewController *)controller;

@end
