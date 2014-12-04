//
//  BGKVHintView.m
//  SecurityGame
//
//  Created by Guest User on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVSingleHintViewController.h"
#import "BGKVLevelContainer.h"
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
    self.hintTitleLabel.text = self.hintTitle;
    self.hintTextTextView.text = self.hintText;
}

- (IBAction)returnToMission
{
    [self unwind:@selector(returnToLevelContainer:)];
}

@end
