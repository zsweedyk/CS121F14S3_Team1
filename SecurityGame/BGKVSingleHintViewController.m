//
//  BGKVHintView.m
//  SecurityGame
//
//  Created by Matt Valentine on 12/2/14.
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
    if (self.hintTitle) {
        self.hintTitleLabel.text = self.hintTitle;
    }
    
    if (self.hintText) {
        self.hintTextTextView.text = self.hintText;
    }
}

- (BOOL)shouldBecomeAvailable:(BGKVPasswordControl *)control
{
    // Returns whether or not the conditions for the hint becoming automatically
    // revealed are satisfied
    
    // 0 is the default value for attempts
    // Therefore, it signifies that this functionality is not being used
    if (self.attempts == 0) {
        return NO;
    }
    
    BOOL correctAttempts = (control.attempts == self.attempts);
    BOOL correctControl = !self.control || self.control == control;
    return correctAttempts && correctControl;
}

- (BOOL)shouldBeInitiallyAvailable
{
    // -1 signifies that the hint should be available without any need for attempts
    return self.attempts == -1;
}


- (BOOL)isEqual:(id)object
{
    // This makes sure that hints with the same text, regardless of whether they are
    // the same hint, don't get added more than once.
    // In particular this is useful if you have a hint on an uncached viewcontroller in Storyboard,
    // as then each time you visit that controller it would end up being a different hint object.
    if ([object isKindOfClass:[BGKVSingleHintViewController class]]) {
        BGKVSingleHintViewController *otherHint = object;
        return [otherHint.hintTitle isEqualToString:self.hintTitle] && [otherHint.hintText isEqualToString:self.hintText];
    }
    return NO;
}


@end
