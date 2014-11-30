//
//  BGKVLevelViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

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

- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender
{
    if (correct) {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"You guessed right!"
                               message:@"Good work!"
                               
                               // By setting delegate:self, dismissing this alert will run "alertView:clickedButtonAtIndex:"
                               delegate:self
                               
                               cancelButtonTitle:@"Next level" otherButtonTitles:nil];
        [alert show];
        
    } else {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"Incorrect"
                               message:@"Try again!"
                               
                               // By setting delegate:nil, dismissing this alert will do nothing at all.
                               delegate:nil
                               
                               cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }

}

#pragma mark MAGIC STRING WARNING : correct
// "correct" is the identifier of the segue that is run when the password is correct.
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"correct" sender:self];
}
@end
