//
//  BGKVLevel2PasswordViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel2PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (BOOL)checkPassword:(NSString *)guess;

@end
