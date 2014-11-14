//
//  BGKVLevel5PasswordViewController.m
//  SecurityGame
//
//  Created by Guest User on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel5PasswordViewController.h"
#import "BGKVLevelContainer.h"

@interface BGKVLevel5PasswordViewController ()

@end

@implementation BGKVLevel5PasswordViewController {
    BOOL _deactivated;
    NSMutableArray *_password;
    int _attemptCount;
}

- (IBAction)pushIPhoneButton:(UIButton *)sender
{
    if (! _password) {
        _password = [[NSMutableArray alloc] init];
    }
    //NSLog(@"Pushed %d with current password %@. (Deactivated? %d)", sender.tag, _password, _deactivated);
    NSAssert([_password count] <= 3, @"Tried to add to password when password already full!");
    
    // Hmm, could there be a problem if buttons are mashed
    // and the order gets mixed up?
    
    if (! _deactivated) {
        NSNumber *input = [NSNumber numberWithInt:sender.tag];
        [_password addObject:input];
        
        if ([_password count] == 4) {
            [self checkPassword];
        }
    }
}

- (void)checkPassword
{
    _deactivated = YES;
    _attemptCount += 1;
    
    BOOL passwordCorrect = [_password isEqualToArray:@[@1,@1,@2,@1]];
    
    if (passwordCorrect) {
        [self performSegueWithIdentifier:@"password correct" sender:self];
    } else {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"Incorrect"
                               message:@"Try again!"
                               delegate:nil
                               cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        _password = nil;
        [alert show];
    }
    
    if (_attemptCount == 3) {
        [self.levelContainer makeHintAtIndexAvailable:2];
    }
    
    _deactivated = NO;
}

@end
