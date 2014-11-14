//
//  BGKVLevelContainer.h
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVLevelViewController;

@interface BGKVLevelContainer : UIViewController <UIActionSheetDelegate>

@property (nonatomic) NSString *initialSegueName;
@property (nonatomic, weak, readonly) BGKVLevelContainer *levelContainer;

// It's possible this should be weak!
@property (nonatomic) BGKVLevelViewController *currentLevelVC;

@property (nonatomic, weak) IBOutlet UIView *levelView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *menuButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *hintButton;
/*
@property (nonatomic, weak) IBOutlet UIBarButtonItem *inventoryButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *leftButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *rightButton;
 */

- (void)showLevelViewController:(BGKVLevelViewController *)newVC;

//- (IBAction)menuButtonAction:(UIBarButtonItem *)sender;

- (void)resetCache;

@end
