//
//  BGKVPasswordControl.m
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPasswordControl.h"
#import "BGKVPhoneControlController.h"
#import "UIView+Scaling.h"

@implementation BGKVPasswordControl

- (void)reset
{
    self.guess = nil;
    self.correct = NO;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)enterPassword:(NSString *)guess
{
    self.attempts++;
    self.guess = guess;
    self.correct = guess && [guess isEqualToString:self.password];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

// Depending on whether the control is initialized programmatically
// or by Interface Builder, the first or the second of these will end
// up getting called, respectively
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
