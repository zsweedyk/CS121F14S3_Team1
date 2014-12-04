//
//  BGKVLevelViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelContainer.h"
#import "BGKVLevelViewController.h"
#import "BGKVAlertViewDelegateTemplate.h"

@interface BGKVLevelViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevelViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)checkPassword:(NSString *)guess
{
    NSAssert(self.password, @"Tried to check password while there is no correct password set. %@", guess);
    return [guess isEqualToString:self.password];
}

- (IBAction)enterPassword:(BGKVPasswordControl *)sender
{
    [self enteredCorrectPassword:sender.correct sender:sender];
}

- (IBAction)enterPasswordFromTextField:(UITextField *)textField
{
    NSString *guess = textField.text;
    if ([self checkPassword:guess]) {
        [self enteredCorrectPassword:YES sender:textField];
    } else {
        [self enteredCorrectPassword:NO sender:textField];
        textField.text = @"";
    }
}

- (IBAction)stupid:(id)sender
{
    [self.levelContainer goToLevel:6];
}

#pragma mark MAGIC STRING WARNING : correct
// "correct" is the identifier of the segue that is run when the password is correct.
- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender
{
    if (correct) {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"You guessed right!"
                               message:@"Good work!"
                               delegate:nil
                               cancelButtonTitle:@"Next level" otherButtonTitles:nil];
        
        // When this alert is dismissed, it will run the code block below
        [BGKVAlertViewDelegateTemplate setActionOfAlertView:alert toAction:^{
            [self correctPasswordAction:sender];
        }];
        [alert show];
        
    } else {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"Incorrect"
                               message:@"Try again!"
                               delegate:nil
                               cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        // When this alert is dismissed, it will run the code block below
        [BGKVAlertViewDelegateTemplate setActionOfAlertView:alert toAction:^{
            [self incorrectPasswordAction:sender];
        }];
        [alert show];
    }

}

- (void)correctPasswordAction:(id)sender
{
    [self performSegueWithIdentifier:@"correct" sender:self];
}

- (void)incorrectPasswordAction:(id)sender
{
    [self updateAvailableHints:sender];
}

- (void)updateAvailableHints:(id)sender
{
    if (!self.hints) {
        return;
    }
    
    if ([sender isKindOfClass:[BGKVPasswordControl class]]) {
        BGKVPasswordControl *control = sender;
        for (BGKVSingleHintViewController *hint in self.hints) {
            if ([hint shouldBecomeAvailable:control]) {
                [self.levelContainer addNewHintWithController:hint];
            }
        }
    }
}

@end
