//
//  BGKVHintView.h
//  SecurityGame
//
//  Created by Guest User on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BGKVPasswordControl;

@interface BGKVSingleHintViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title andText:(NSString *)text;

@property (nonatomic) NSString *hintTitle;
@property (nonatomic) NSString *hintText;

@property (nonatomic) IBOutlet UILabel *hintTitleLabel;
@property (nonatomic) IBOutlet UITextView *hintTextTextView;

// Used to make the hint available automatically after a given number of attempts
// (Functionality is disabled if attempts is the default value, 0)
// If attempts is -1, then that means this hint should become available upon first
// reaching the stage
@property (nonatomic) NSInteger attempts;

// Used to make the hint only take into account a certain control when deciding
// if it should be automatically made available.
// If this is not set, then any control will do.
@property (nonatomic, weak) IBOutlet BGKVPasswordControl *control;

- (BOOL)shouldBecomeAvailable:(BGKVPasswordControl *)control;
- (BOOL)shouldBeInitiallyAvailable;

@end
