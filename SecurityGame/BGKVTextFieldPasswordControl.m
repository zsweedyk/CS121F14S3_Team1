//
//  BGKVTextFieldPasswordControl.m
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVTextFieldPasswordControl.h"

@implementation BGKVTextFieldPasswordControl

- (void)reset
{
    [super reset];
    self.passwordField.text = @"";
}

- (void)setup
{
    [super setup];
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:self.bounds];
    self.passwordField = passwordField;
    
    passwordField.returnKeyType = UIReturnKeyDone;
    passwordField.font = [self.passwordField.font fontWithSize:20];
    passwordField.tintColor = [UIColor blackColor];
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.keyboardType = UIKeyboardTypeDefault;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    passwordField.delegate = self;
    
    [self addSubview:passwordField];
    [self reset];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self enterPassword:textField.text];
    //textField.text = @"";
    return NO;
}

@end
