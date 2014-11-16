//
//  BGKVLevel9PasswordViewController.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel9PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextField* passwordField;

- (BOOL)checkPassword:(NSString *)guess;

@end
