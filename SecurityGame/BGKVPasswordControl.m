//
//  BGKVPasswordControl.m
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPasswordControl.h"
#import "BGKVPhoneControlController.h"
#import "UIView+Scaling.h"

@implementation BGKVPasswordControl

- (void)reset
{
    [_controller reset];
    self.guess = nil;
    self.correct = NO;
}

- (void)setup
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (void)setupWithController:(BGKVPasswordControlController *)controller keepAspect:(BOOL)keepAspect
{
    self.backgroundColor = [UIColor clearColor];
    self.attempts = [NSNumber numberWithInt:0];
    
    self.controller = controller;
    controller.parentControl = self;
    
    [controller.view scaleToFrame:self.bounds keepAspect:keepAspect];
    [self addSubview:controller.view];
    
    [self reset];
}


- (void)enterPassword:(NSString *)guess
{
    self.attempts = [NSNumber numberWithInt:[self.attempts intValue] + 1];
    self.guess = guess;
    self.correct = [guess isEqualToString:self.password];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self reset];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}


@end
