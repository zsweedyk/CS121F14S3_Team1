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
@interface BGKVHintViewController : UIViewController // UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic) IBOutlet UIView *pageView;
@property (nonatomic) IBOutlet UIView *pageInBackground;

- (BOOL)hasHints;

// Returns YES if hint is added
// Returns NO if it was already one of the hints, and is therefore not added
- (BOOL)addNewHintWithTitle:(NSString *)title andText:(NSString *)text;
- (BOOL)addNewHintWithController:(UIViewController *)controller;

@property (nonatomic) NSMutableArray *pages;

@end
