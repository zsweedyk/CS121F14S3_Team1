//
//  BGKVLevelViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVLevelContainer;

@interface BGKVLevelViewController : UIViewController

@property (nonatomic, weak) BGKVLevelContainer *levelContainer;

- (IBAction) goToPreviousScene:(UIStoryboardSegue *)segue;

@end
