//
//  BGKVLevel1PasswordViewController.m
//  SecurityGame
//
//  Created by CS121 on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel1PasswordViewController.h"

@interface BGKVLevel1PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel1PasswordViewController

- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender
{
    [super enteredCorrectPassword:correct sender:sender];
    
    BGKVPasswordControl *control = sender;
    if (!correct && control.attempts == 3) {
        
    }
}

@end