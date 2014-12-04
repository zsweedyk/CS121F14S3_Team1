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

@interface BGKVLevelContainer : UIViewController <UIActionSheetDelegate>

@property (nonatomic) BGKVLevelViewControllerCache *cache;
@property (nonatomic) BGKVHintViewController *hintVC;
 
@property (nonatomic, weak, readonly) BGKVLevelContainer *levelContainer;

// It's possible this should be weak!
@property (nonatomic) BGKVLevelViewController *currentLevelVC;

@property (nonatomic, weak) IBOutlet UIView *levelView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *menuButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *hintButton;

- (void)showLevelViewController:(BGKVLevelViewController *)newVC;

- (void)resetCache;

- (IBAction)returnToLevelContainer:(UIStoryboardSegue *)segue;

@end
