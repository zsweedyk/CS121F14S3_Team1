//
//  BGKVLevel11PasswordViewController.h
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel11PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextView* informationField;
@property (weak, nonatomic) IBOutlet UIButton* submitButton;
@property (weak, nonatomic) IBOutlet UITextView* postSubmitInfo;
@property (weak, nonatomic) IBOutlet UIButton* continueButton;

@end
