//
//  BGKVPhoneControl.m
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPhoneControl.h"
#import "BGKVPhoneControlController.h"

@implementation BGKVPhoneControl {
    BGKVPhoneControlController *_controller;
}

- (void)reset
{
    [_controller reset];
    self.guess = nil;
    self.correct = NO;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.attempts = [NSNumber numberWithInt:0];
    
    _controller = [[BGKVPhoneControlController alloc] init];
    _controller.parentControl = self;
    [self addSubview:_controller.view];
    
    [self reset];
}


- (void)enterPassword:(NSString *)guess
{
    self.attempts = [NSNumber numberWithInt:[self.attempts intValue] + 1];
    self.guess = guess;
    self.correct = [guess isEqualToString:self.password];
    [self sendActionsForControlEvents:UIControlEventEditingDidEndOnExit];
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
