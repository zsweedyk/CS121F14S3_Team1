//
//  BGKVHintViewController.h
//  SecurityGame
//
//  Created by Guest User on 11/13/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

// Some hackery going on here. This thing is its own delegate.
// This is to facilitate use in storyboards.
@interface BGKVHintViewController : UITabBarController <UITabBarControllerDelegate>

- (void)initialize;

@end
