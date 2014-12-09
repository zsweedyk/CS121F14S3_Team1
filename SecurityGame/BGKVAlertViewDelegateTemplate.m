//
//  BGKVAlertViewDelegateTemplate.m
//  SecurityGame
//
//  Created by Matt Valentine on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVAlertViewDelegateTemplate.h"
#import <objc/runtime.h>

@implementation BGKVAlertViewDelegateTemplate {
    void (^_simpleAction)();
    void (^_complexAction)(UIAlertView *, NSInteger);
}

+ (void)setActionOfAlertView:(UIAlertView *)alert toAction:(void (^)())action
{
    BGKVAlertViewDelegateTemplate *delegate = [[BGKVAlertViewDelegateTemplate alloc] initWithAction:action];
    [delegate bindLifetimeToObject:alert];
    alert.delegate = delegate;
}

+ (void)setActionOfAlertView:(UIAlertView *)alert toComplexAction:(void (^)(UIAlertView *, NSInteger))complexAction
{
    BGKVAlertViewDelegateTemplate *delegate = [[BGKVAlertViewDelegateTemplate alloc] initWithComplexAction:complexAction];
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
        _simpleAction = action;
    }
    return self;
}

- (instancetype)initWithComplexAction:(void (^)(UIAlertView *, NSInteger))complexAction
{
    self = [super init];
    if (self) {
        _complexAction = complexAction;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_simpleAction) {
        _simpleAction();
    } else {
        _complexAction(alertView, buttonIndex);
    }
}

@end
