//
//  BGKVLevel1PasswordViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel1PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (IBAction)checkPassword:(UITextField *)sender;

@end
