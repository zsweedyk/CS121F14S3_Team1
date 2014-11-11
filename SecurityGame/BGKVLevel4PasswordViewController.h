//
//  BGKVLevel4PasswordViewController.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel4PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (BOOL)checkPassword:(NSString *)guess;

@end
