//
//  BGKVHintView.m
//  SecurityGame
//
//  Created by Guest User on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVSingleHintViewController.h"
#import "BGKVLevelContainer.h"
#import "BGKVPasswordControl.h"
#import "UIViewController+Unwind.h"

@implementation BGKVSingleHintViewController

- (instancetype)initWithTitle:(NSString *)title andText:(NSString *)text
{
    self = [self init];
    if (self) {
        self.hintTitle = title;
        self.hintText = text;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.hintTitle) {
        self.hintTitleLabel.text = self.hintTitle;
    }
    
    if (self.hintText) {
        self.hintTextTextView.text = self.hintText;
    }
}

- (IBAction)returnToMission
{
    [self unwind:@selector(returnToLevelContainer:)];
}

- (BOOL)shouldBecomeAvailable:(BGKVPasswordControl *)control
{
    if (self.attempts == 0) {
        return NO;
    }
    
    BOOL correctAttempts = (control.attempts == self.attempts);
    BOOL correctControl = !self.control || self.control == control;
    return correctAttempts && correctControl;
}

- (BOOL)shouldBeInitiallyAvailable
{
    return self.attempts == -1;
}


- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[BGKVSingleHintViewController class]]) {
        BGKVSingleHintViewController *otherHint = object;
        return [otherHint.hintTitle isEqualToString:self.hintTitle] && [otherHint.hintText isEqualToString:self.hintText];
    }
    return NO;
}


@end
