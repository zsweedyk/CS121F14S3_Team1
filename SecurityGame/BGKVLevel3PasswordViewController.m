//
//  BGKVLevel3PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/7/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel3PasswordViewController.h"

@interface BGKVLevel3PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel3PasswordViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.passwordField.delegate = self;
}

// Level password checker
- (BOOL)checkPassword:(NSString *)guess
{
    NSString* password = @"Taylor";
    return [guess isEqualToString:password];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.passwordField) {
        [textField resignFirstResponder];
        if ([self checkPassword:self.passwordField.text]) {
            UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:@"You guessed right!"
                                   message:@"Taylor used her name as her password. That's not a good decision!"
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

// Segue from "Okay" button to loading screen 
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
