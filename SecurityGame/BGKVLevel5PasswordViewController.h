//
//  BGKVLevel5PasswordViewController.h
//  SecurityGame
//
//  Created by Guest User on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel5PasswordViewController : BGKVLevelViewController

- (IBAction)pushIPhoneButton:(UIButton *)sender;
- (BOOL)checkPassword:(NSArray *)password;

@property (nonatomic) IBOutletCollection(UIImageView) NSArray *passwordCharacterEnteredIcons;

@end
