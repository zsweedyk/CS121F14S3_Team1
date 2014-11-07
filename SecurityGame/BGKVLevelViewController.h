//
//  BGKVLevelViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVSillyViewController;

@interface BGKVLevelViewController : UIViewController

- (IBAction) goToPreviousScene:(UIStoryboardSegue *)segue;

@property (nonatomic, weak) BGKVSillyViewController *levelMaster;

@end
