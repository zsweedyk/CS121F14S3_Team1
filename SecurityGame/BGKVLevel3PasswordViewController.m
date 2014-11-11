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
                                   message:@"Taylor used her name as her password."
                                   delegate:nil
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
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
