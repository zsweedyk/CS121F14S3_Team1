//
//  BGKVAlertViewDelegateTemplate.m
//  SecurityGame
//
//  Created by Guest User on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVAlertViewDelegateTemplate.h"
#import <objc/runtime.h>

@implementation BGKVAlertViewDelegateTemplate {
    void (^_action)();
}

+ (void)setActionOfAlertView:(UIAlertView *)alert toAction:(void (^)())action
{
    BGKVAlertViewDelegateTemplate *delegate = [[BGKVAlertViewDelegateTemplate alloc] initWithAction:action];
    [delegate bindLifetimeToObject:alert];
    alert.delegate = delegate;
}

- (void)bindLifetimeToObject:(id)object
{
    objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (instancetype)initWithAction:(void (^)())action
{
    self = [super init];
    if (self) {
        _action = action;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _action();
}

@end
