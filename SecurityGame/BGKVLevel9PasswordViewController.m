//
//  BGKVLevel9PasswordViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel9PasswordViewController.h"

@interface BGKVLevel9PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel9PasswordViewController

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

- (BOOL)checkPassword:(NSString *)guess
{
    NSString* password = @"CgF3n8x6";
    return [guess isEqualToString:password];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.passwordField) {
        [textField resignFirstResponder];
        if ([self checkPassword:self.passwordField.text]) {
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
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.passwordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
