//
//  BGKVLevel18PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel18PasswordViewController.h"

@interface BGKVLevel18PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel18PasswordViewController

- (IBAction)usbDriveTapped:(UIButton*)sender
{
    // http://stackoverflow.com/questions/16352523/glow-effect-to-custom-uibutton-like-info-uibutton
    if (sender.tag == 1) {
        self.usbDriveButton1.selected = YES;
        self.usbDriveButton2.selected = NO;
        self.usbDriveButton3.selected = NO;
        [self startButtonGlow: 1];
    } else if (sender.tag == 2) {
        self.usbDriveButton1.selected = NO;
        self.usbDriveButton2.selected = YES;
        self.usbDriveButton3.selected = NO;
        [self startButtonGlow: 2];
    } else {
        self.usbDriveButton1.selected = NO;
        self.usbDriveButton2.selected = NO;
        self.usbDriveButton3.selected = YES;
        [self startButtonGlow: 3];
    }
}

- (IBAction)computerTapped:(id)sender
{
    if (self.usbDriveButton1.selected) {
        // Unhide random information
        self.passwordInformationField.hidden = YES;
        self.randomInformationField1.hidden = NO;
        self.randomInformationField2.hidden = YES;
        self.ejectUsbDriveButton.hidden = NO;
    } else if (self.usbDriveButton2.selected) {
        // Unhide secret information
        self.passwordInformationField.hidden = NO;
        self.randomInformationField1.hidden = YES;
        self.randomInformationField2.hidden = YES;
        self.ejectUsbDriveButton.hidden = NO;
    } else if (self.usbDriveButton3.selected) {
        // Unhide random information
        self.passwordInformationField.hidden = YES;
        self.randomInformationField1.hidden = YES;
        self.randomInformationField2.hidden = NO;
        self.ejectUsbDriveButton.hidden = NO;
    }
}

- (IBAction)ejectButtonTapped:(id)sender
{
    self.passwordInformationField.hidden = YES;
    self.randomInformationField1.hidden = YES;
    self.randomInformationField2.hidden = YES;
    self.ejectUsbDriveButton.hidden = YES;
    
    // Unselect USB drive
    self.usbDriveButton1.selected = NO;
    self.usbDriveButton2.selected = NO;
    self.usbDriveButton3.selected = NO;
    [self removeButtonGlow];
}

- (void) startButtonGlow:(int)drive
{
    if (drive == 1) {
        self.usbDriveButton1.layer.shadowColor = [UIColor cyanColor].CGColor;
        self.usbDriveButton1.layer.shadowRadius = 10.0f;
        self.usbDriveButton1.layer.shadowOpacity = 1.0f;
        self.usbDriveButton1.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton2.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton2.layer.shadowRadius = 10.0f;
        self.usbDriveButton2.layer.shadowOpacity = 1.0f;
        self.usbDriveButton2.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton3.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton3.layer.shadowRadius = 10.0f;
        self.usbDriveButton3.layer.shadowOpacity = 1.0f;
        self.usbDriveButton3.layer.shadowOffset = CGSizeZero;
    } else if (drive == 2) {
        self.usbDriveButton2.layer.shadowColor = [UIColor cyanColor].CGColor;
        self.usbDriveButton2.layer.shadowRadius = 10.0f;
        self.usbDriveButton2.layer.shadowOpacity = 1.0f;
        self.usbDriveButton2.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton1.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton1.layer.shadowRadius = 10.0f;
        self.usbDriveButton1.layer.shadowOpacity = 1.0f;
        self.usbDriveButton1.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton3.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton3.layer.shadowRadius = 10.0f;
        self.usbDriveButton3.layer.shadowOpacity = 1.0f;
        self.usbDriveButton3.layer.shadowOffset = CGSizeZero;
    } else {
        self.usbDriveButton1.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton1.layer.shadowRadius = 10.0f;
        self.usbDriveButton1.layer.shadowOpacity = 1.0f;
        self.usbDriveButton1.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton2.layer.shadowColor = [UIColor clearColor].CGColor;
        self.usbDriveButton2.layer.shadowRadius = 10.0f;
        self.usbDriveButton2.layer.shadowOpacity = 1.0f;
        self.usbDriveButton2.layer.shadowOffset = CGSizeZero;
        self.usbDriveButton3.layer.shadowColor = [UIColor cyanColor].CGColor;
        self.usbDriveButton3.layer.shadowRadius = 10.0f;
        self.usbDriveButton3.layer.shadowOpacity = 1.0f;
        self.usbDriveButton3.layer.shadowOffset = CGSizeZero;
    }
}

- (void) removeButtonGlow
{
    self.usbDriveButton1.layer.shadowColor = [UIColor clearColor].CGColor;
    self.usbDriveButton1.layer.shadowRadius = 10.0f;
    self.usbDriveButton1.layer.shadowOpacity = 1.0f;
    self.usbDriveButton1.layer.shadowOffset = CGSizeZero;
    self.usbDriveButton2.layer.shadowColor = [UIColor clearColor].CGColor;
    self.usbDriveButton2.layer.shadowRadius = 10.0f;
    self.usbDriveButton2.layer.shadowOpacity = 1.0f;
    self.usbDriveButton2.layer.shadowOffset = CGSizeZero;
    self.usbDriveButton3.layer.shadowColor = [UIColor clearColor].CGColor;
    self.usbDriveButton3.layer.shadowRadius = 10.0f;
    self.usbDriveButton3.layer.shadowOpacity = 1.0f;
    self.usbDriveButton3.layer.shadowOffset = CGSizeZero;
}

- (BOOL)checkComputerPassword:(NSString *)guess
{
    NSString* password = @"C3l3brat3!";
    return [guess isEqualToString:password];
}

- (BOOL)checkPhonePassword:(NSString *)guess
{
    NSString* password = @"0110";
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
    self.phonePasswordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
