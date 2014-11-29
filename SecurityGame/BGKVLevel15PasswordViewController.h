//
//  BGKVLevel15PasswordViewController.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/17/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel15PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextView* informationField;
@property (weak, nonatomic) IBOutlet UIButton* continueButton;
@property (weak, nonatomic) IBOutlet UIButton* tryAgainButton;
@property (weak, nonatomic) IBOutlet UITextView* explanationField;

@property (weak, nonatomic) IBOutlet UIButton* sendButton;
@property (weak, nonatomic) IBOutlet UIButton* dontSendButton;

@end
