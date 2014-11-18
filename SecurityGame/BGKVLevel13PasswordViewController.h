//
//  BGKVLevel13PasswordViewController.h
//  SecurityGame
//
//  Created by CS121 on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel13PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (BOOL)checkPassword:(NSString *)guess;

@end

