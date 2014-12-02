//
//  BGKVTextFieldPasswordControl.m
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVTextFieldPasswordControl.h"

@implementation BGKVTextFieldPasswordControl

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:self.bounds];
    //passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.returnKeyType = UIReturnKeyDone;
    passwordField.font = [self.passwordField.font fontWithSize:20];
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.keyboardType = UIKeyboardTypeDefault;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    passwordField.delegate = self;
    
    [self addSubview:passwordField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self enterPassword:textField.text];
    textField.text = @"";
    return YES;
}

@end
