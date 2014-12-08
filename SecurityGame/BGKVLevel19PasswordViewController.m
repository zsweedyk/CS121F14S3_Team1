//
//  BGKVLevel9PasswordViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel19PasswordViewController.h"

@interface BGKVLevel19PasswordViewController ()

@end

@implementation BGKVLevel19PasswordViewController

- (IBAction)usbDriveTapped:(id)sender
{
    self.usbNotPluggedInField.hidden = YES;

    if (self.usbDriveButton.selected) {
        self.usbDriveButton.selected = NO;
        [self removeButtonGlow];
    } else {
        self.usbDriveButton.selected = YES;
        [self startButtonGlow];
    }
}

- (IBAction)goToEmailTapped:(id)sender
{
    if (self.usbDriveButton.selected) {
        self.usbDriveButton.selected = NO;
        [self removeButtonGlow];
        [self performSegueWithIdentifier:@"SegueToEmailList" sender:self];
    } else {
        self.usbNotPluggedInField.hidden = NO;
    }
    
}

- (IBAction)finalDownloadLinkTapped:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc]
                           initWithTitle:@"You found the right link!"
                           message:@"Good work!"
                           delegate:self
                           cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alert show];
}

// http://stackoverflow.com/questions/16352523/glow-effect-to-custom-uibutton-like-info-uibutton
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"correct" sender:self];
}

@end
