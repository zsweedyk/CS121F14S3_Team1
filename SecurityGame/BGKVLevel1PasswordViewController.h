//
//  BGKVLevel1PasswordViewController.h
//  SecurityGame
//
//  Created by CS121 on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel1PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (BOOL)checkPassword:(NSString *)guess;

@end
