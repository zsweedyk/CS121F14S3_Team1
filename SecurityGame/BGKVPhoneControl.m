//
//  BGKVPhoneControl.m
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPhoneControl.h"
#import "BGKVPhoneControlController.h"
#import "UIView+Scaling.h"

@implementation BGKVPhoneControl
- (void)reset
{
    [super reset];
    [self.controller reset];
}

- (void)setup
{
    [self setupWithController:[[BGKVPhoneControlController alloc] init]
                   keepAspect:YES];
}

- (void)setupWithController:(BGKVPhoneControlController *)controller keepAspect:(BOOL)keepAspect
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
    [super enterPassword:guess];
    [self reset];
}

@end
