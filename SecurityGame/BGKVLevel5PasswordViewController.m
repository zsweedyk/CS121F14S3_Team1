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
    BOOL _deactivated; // Might be unnecessary. Probably is.
    NSMutableArray *_password;
    int _attemptCount;
}

- (void)enterDigit:(NSInteger)digit
{
    //NSLog(@"Pushed %d with current password %@. (Deactivated? %d)", sender.tag, _password, _deactivated);
    NSAssert([_password count] < 4, @"Tried to add to password when password already full!");
    
    [_password addObject:[NSNumber numberWithInteger:digit]];
}

- (IBAction)pushIPhoneButton:(UIButton *)sender
{
    if (self.passwordCharacterEnteredIcons) {
        NSAssert([self.passwordCharacterEnteredIcons count] == 4, @"Level5 Password Controller expected 4 character_entered_icons (or nil)");
    }
    
    if (! _password) {
        _password = [[NSMutableArray alloc] init];
    }
    
    // Hmm, could there be a problem if buttons are mashed
    // and the order gets mixed up?
    
    if (! _deactivated) {
        [self enterDigit:sender.tag];
        
        if (self.passwordCharacterEnteredIcons) {
            UIControl *icon = self.passwordCharacterEnteredIcons[[_password count] - 1];
            icon.hidden = NO;
        }
        
        if ([_password count] == 4) {
            [self enterPassword];
        }
    }
}

- (BOOL)checkPassword:(NSArray *)password
{
    return [password isEqualToArray:@[@1,@1,@2,@1]];
}

- (void)enterPassword
{
    _deactivated = YES;
    _attemptCount += 1;
    
    NSAssert([_password count] == 4, @"Tried to check password that wasn't full! Password: %@", _password);
    
    if ([self checkPassword:_password]) {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"You guessed right!"
                               message:@"Good work!"
                               delegate:self // IMPORTANT : This one has an action on accept...
                               cancelButtonTitle:@"Next level" otherButtonTitles:nil];
        [alert show];
    } else {
        if (self.passwordCharacterEnteredIcons) {
            for (UIControl *icon in self.passwordCharacterEnteredIcons) {
                icon.hidden = YES;
            }
        }
        _password = nil;
        
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"Incorrect"
                               message:@"Try again!"
                               delegate:nil // IMPORTANT : ... While this one does not!
                               cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
    
    /*
    if (_attemptCount == 3) {
        [self.levelContainer makeHintAtIndexAvailable:2];
    }
    */
    
    _deactivated = NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"password correct" sender:self];
}

@end
