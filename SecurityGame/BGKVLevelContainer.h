//
//  BGKVLevelContainer.h
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVLevelViewController;
@class BGKVLevelViewControllerCache;
@class BGKVHintViewController;
@class BGKVSingleHintViewController;

@interface BGKVLevelContainer : UIViewController <UIActionSheetDelegate>

// Set in Storyboard via User Defined Runtime Attributes
@property (nonatomic) NSInteger level;



// Below should NOT be set in Storyboard

@property (nonatomic) BGKVLevelViewControllerCache *cache;
@property (nonatomic) BGKVHintViewController *hintVC;
 
@property (nonatomic, weak, readonly) BGKVLevelContainer *levelContainer;
@property (nonatomic) BOOL newHintAvailable;

// It's possible this should be weak!
@property (nonatomic) BGKVLevelViewController *currentLevelVC;

// Set in xib
@property (nonatomic, weak) IBOutlet UIView *levelView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *menuButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *hintButton;

- (void)showLevelViewController:(BGKVLevelViewController *)newVC;

- (void)reset;

- (IBAction)returnToLevelContainer:(UIStoryboardSegue *)segue;


- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text updateNewHintAvailable:(BOOL)update;
- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text;
- (void)addNewHintWithController:(UIViewController *)controller;

@end
