//
//  BGKVLevel2PasswordViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel2PasswordViewController.h"
#import "BGKVPasswordControl.h"
#import "BGKVLevelContainer.h"

@interface BGKVLevel2PasswordViewController ()

@end

@implementation BGKVLevel2PasswordViewController

- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender{
    [super enteredCorrectPassword:correct sender:sender];
    
    // Not always kosher...
    BGKVPasswordControl *control = sender;
    
    if (!correct && control.attempts == 4) {
        [self.levelContainer addNewHintWithTitle:@"BLAH" andText:@"Maybe it starts with 'f'"];
    }
}

@end
