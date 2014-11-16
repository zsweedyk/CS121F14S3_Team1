//
//  BGKVLevel12PasswordViewController.h
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelViewController.h"

@interface BGKVLevel12PasswordViewController : BGKVLevelViewController

@property (weak, nonatomic) IBOutlet UITextView* informationField;
@property (weak, nonatomic) IBOutlet UIButton* continueButton;
@property (weak, nonatomic) IBOutlet UIButton* returnButton;
@property (weak, nonatomic) IBOutlet UITextView* explanationField;

@property (weak, nonatomic) IBOutlet UIButton* httpButton;
@property (weak, nonatomic) IBOutlet UIButton* httpsButton;

@property (weak, nonatomic) IBOutlet UITextView* httpInformationField;
@property (weak, nonatomic) IBOutlet UITextView* httpsInformationField;

@end
