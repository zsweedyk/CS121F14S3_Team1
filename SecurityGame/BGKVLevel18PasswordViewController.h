//
//  BGKVLevel18PasswordViewController.h
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@class BGKVPhoneControl;

@interface BGKVLevel18PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UIButton* usbDriveButton1;
@property (weak, nonatomic) IBOutlet UIButton* usbDriveButton2;
@property (weak, nonatomic) IBOutlet UIButton* usbDriveButton3;
@property (weak, nonatomic) IBOutlet UITextField* passwordInformationField;
@property (weak, nonatomic) IBOutlet UITextView* randomInformationField1;
@property (weak, nonatomic) IBOutlet UITextField* randomInformationField2;
@property (weak, nonatomic) IBOutlet UIButton* ejectUsbDriveButton;

@property (weak, nonatomic) IBOutlet BGKVPhoneControl* phonePasswordField;
@property (weak, nonatomic) IBOutlet UIView* phonePasswordInformationField;

@end
