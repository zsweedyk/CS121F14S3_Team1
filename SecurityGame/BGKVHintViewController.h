//
//  BGKVHintViewController.h
//  SecurityGame
//
//  Created by Matt Valentine on 11/13/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

// Some hackery going on here. This thing is its own delegate.
// This is to facilitate use in storyboards.
@interface BGKVHintViewController : UIViewController // UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic, weak) IBOutlet UIView *pageView;
@property (nonatomic, weak) IBOutlet UIView *pageInBackground;
@property (nonatomic, weak) IBOutlet UILabel *missionNumberLabel;

- (instancetype)initWithLevel:(NSInteger)level;

- (BOOL)hasHints;

// Returns YES if hint is added
// Returns NO if it was already one of the hints, and is therefore not added
- (BOOL)addNewHintWithTitle:(NSString *)title andText:(NSString *)text;
- (BOOL)addNewHintWithController:(UIViewController *)controller;

@property (nonatomic) NSMutableArray *pages;
@property (nonatomic) NSInteger level;

@end
