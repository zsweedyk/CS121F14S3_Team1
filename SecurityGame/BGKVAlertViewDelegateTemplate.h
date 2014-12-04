//
//  BGKVAlertViewDelegateTemplate.h
//  SecurityGame
//
//  Created by Guest User on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVAlertViewDelegateTemplate : NSObject <UIAlertViewDelegate>

+ (void)setActionOfAlertView:(UIAlertView *)alert toAction:(void (^)())action;
+ (void)setActionOfAlertView:(UIAlertView *)alert toComplexAction:(void (^)(UIAlertView *, NSInteger))complexAction;

- (instancetype)initWithAction:(void (^)())action;
- (instancetype)initWithComplexAction:(void (^)(UIAlertView *, NSInteger))complexAction;

@end
