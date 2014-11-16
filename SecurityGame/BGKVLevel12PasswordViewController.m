//
//  BGKVLevel12PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel12PasswordViewController.h"

@interface BGKVLevel12PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel12PasswordViewController


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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
