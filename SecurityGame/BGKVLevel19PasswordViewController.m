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
    self.usbDriveButton.selected = YES;
    self.usbNotPluggedInField.hidden = YES;
    // http://stackoverflow.com/questions/16352523/glow-effect-to-custom-uibutton-like-info-uibutton
    [self startButtonGlow];
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
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}

@end
