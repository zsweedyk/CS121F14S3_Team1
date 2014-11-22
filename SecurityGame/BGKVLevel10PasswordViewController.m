//
//  BGKVLevel10PasswordViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel10PasswordViewController.h"

@interface BGKVLevel10PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel10PasswordViewController

- (IBAction)usbDriveTapped:(id)sender
{
    self.usbDriveButton.selected = YES;
    // http://stackoverflow.com/questions/16352523/glow-effect-to-custom-uibutton-like-info-uibutton
    [self startButtonGlow];
}

- (IBAction)computerTapped:(id)sender
{
    if (self.usbDriveButton.selected) {
        // Unhide secret information
        self.passwordInformationField.hidden = NO;
        self.ejectUsbDriveButton.hidden = NO;
    }
}

- (IBAction)ejectButtonTapped:(id)sender
{
    self.passwordInformationField.hidden = YES;
    self.ejectUsbDriveButton.hidden = YES;
    
    // Unselect USB drive
    self.usbDriveButton.selected = NO;
    [self removeButtonGlow];
}

- (void) startButtonGlow
{
    self.usbDriveButton.layer.shadowColor = [UIColor cyanColor].CGColor;
    self.usbDriveButton.layer.shadowRadius = 10.0f;
    self.usbDriveButton.layer.shadowOpacity = 1.0f;
    self.usbDriveButton.layer.shadowOffset = CGSizeZero;
}

- (void) removeButtonGlow
{
    self.usbDriveButton.layer.shadowColor = [UIColor clearColor].CGColor;
    self.usbDriveButton.layer.shadowRadius = 10.0f;
    self.usbDriveButton.layer.shadowOpacity = 1.0f;
    self.usbDriveButton.layer.shadowOffset = CGSizeZero;
}

- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender
{
    if (correct && sender == self.phonePasswordField) {
        // Reveal the hidden password for the computer
        self.phonePasswordInformationField.hidden = NO;
    } else {
        [super enteredCorrectPassword:correct sender:sender];
    }
}



/*
- (BOOL)checkComputerPassword:(NSString *)guess
{
    NSString* password = @"alphabet";
    return [guess isEqualToString:password];
}
 
- (BOOL)checkPhonePassword:(NSString *)guess
{
    NSString* password = @"8443";
    return [guess isEqualToString:password];
}
 
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.passwordField) {
        [textField resignFirstResponder];
        if ([self checkComputerPassword:self.passwordField.text]) {
            UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:@"You guessed right!"
                                   message:@"Good work!"
                                   delegate:self
                                   cancelButtonTitle:@"Next level" otherButtonTitles:nil];
            [alert show];
        } else {
            UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:@"Incorrect"
                                   message:@"Try again!"
                                   delegate:nil
                                   cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            self.passwordField.text = @"";
            [alert show];
        }
        return YES;
    }
    else if (textField == self.phonePasswordField) {
        [textField resignFirstResponder];
        if ([self checkPhonePassword:self.phonePasswordField.text]) {
            // Reveal the hidden password for the computer
            self.phonePasswordInformationField.hidden = NO;
        } else {
            UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:@"Incorrect"
                                   message:@"Try again!"
                                   delegate:nil
                                   cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            self.passwordField.text = @"";
            [alert show];
        }
        return YES;
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}
*/

@end
