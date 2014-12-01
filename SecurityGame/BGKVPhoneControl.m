//
//  BGKVPhoneControl.m
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPhoneControl.h"
#import "BGKVPhoneControlController.h"

@implementation BGKVPhoneControl
- (void)setup
{
    [self setupWithController:[[BGKVPhoneControlController alloc] init]
                   keepAspect:YES];
}

@end
