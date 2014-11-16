//
//  BGKVLevel10PasswordViewController.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel10PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIButton* usbDriveButton;
@property (weak, nonatomic) IBOutlet UITextField* passwordInformationField;
@property (weak, nonatomic) IBOutlet UIButton* ejectUsbDriveButton;

@property (weak, nonatomic) IBOutlet UITextField* phonePasswordField;
@property (weak, nonatomic) IBOutlet UITextField* phonePasswordInformationField;

- (BOOL)checkComputerPassword:(NSString *)guess;
- (BOOL)checkPhonePassword:(NSString *)guess;

@end
