//
//  BGKVLevel11PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel11PasswordViewController.h"

@implementation BGKVLevel11PasswordViewController

- (IBAction) submitPressed:(id)sender
{
    self.informationField.hidden = YES;
    self.submitButton.hidden = YES;
    
    self.postSubmitInfo.hidden = NO;
    self.continueButton.hidden = NO;
}


@end
