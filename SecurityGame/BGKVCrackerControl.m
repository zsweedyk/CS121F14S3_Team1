//
//  BGKVCrackerControl.m
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCrackerControl.h"
#import "BGKVCrackerKeyboard.h"

@implementation BGKVCrackerControl

- (void)setup
{
    [super setup];
    
    BGKVCrackerKeyboard *keyboard = [[BGKVCrackerKeyboard alloc] initDefault];//WithFrame:CGRectMake(0, 0, 1024, 352)];
    keyboard.textField = self.passwordField;
}

@end
