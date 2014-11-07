//
//  BGKVSillyViewController.h
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVLevelViewController;

@interface BGKVSillyViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView* container;
@property (nonatomic, weak) IBOutlet UIBarButtonItem* backButton;
@property (nonatomic, weak) BGKVLevelViewController* currentVC;

-(void)moveToNewController:(BGKVLevelViewController *) newController;
-(void)presentFirstController:(BGKVLevelViewController *) firstController;

@end
