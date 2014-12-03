//
//  BGKVHintViewController.m
//  SecurityGame
//
//  Created by Guest User on 11/13/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVHintViewController.h"
#import "BGKVSingleHintViewController.h"
#import "UIBarButtonItem+Badge.h"

@implementation BGKVHintViewController

- (instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text
{
    [self addNewHintWithController:[[BGKVSingleHintViewController alloc] initWithTitle:title andText:text]];
}

- (void)addNewHintWithController:(UIViewController *)controller
{
    [self.pages addObject:controller];
}

- (void)setup
{
    self.pages = [[NSMutableArray alloc] init];
    self.dataSource = self;
    [self addNewHintWithTitle:@"MISSION" andText:@"Crack that password!"];
    [self addNewHintWithTitle:@"New Information!" andText:@"Maybe the password hint could give you ideas!"];
    [self setViewControllers:@[self.pages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if (nil == viewController) {
        return _pages[0];
    }
    NSInteger idx = [_pages indexOfObject:viewController];
    NSParameterAssert(idx != NSNotFound);
    if (idx >= [_pages count] - 1) {
        // we're at the end of the _pages array
        return nil;
    }
    // return the next page's view controller
    return _pages[idx + 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (nil == viewController) {
        return _pages[0];
    }
    NSInteger idx = [_pages indexOfObject:viewController];
    NSParameterAssert(idx != NSNotFound);
    if (idx <= 0) {
        // we're at the end of the _pages array
        return nil;
    }
    // return the previous page's view controller
    return _pages[idx - 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pages indexOfObject:self.viewControllers[0]];
}


@end
