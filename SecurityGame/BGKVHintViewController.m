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

@interface BGKVHintViewController() <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@end

@implementation BGKVHintViewController {
    UIPageViewController *_pageViewController;
}

- (BOOL)hasHints
{
    return _pageViewController.viewControllers && self.pages && [self.pages count] > 0;
}

- (void)setup
{
    self.pages = [[NSMutableArray alloc] init];
    //self.dataSource = self;
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:@{UIPageViewControllerOptionSpineLocationKey: [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMid]}];
    _pageViewController.doubleSided = YES;
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    [self.view addSubview:_pageViewController.view];
}

- (instancetype)init
{
    //self = [super initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = self.pageView.frame;
    // Double width-wise, because we have two pages.
    _pageViewController.view.frame = CGRectMake(frame.origin.x-frame.size.width, frame.origin.y,
                                                frame.size.width*2, frame.size.height);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateIndicators];
}

- (void)updateIndicators
{
    NSInteger idx = [self presentationIndexForPageViewController:_pageViewController];
    NSLog(@"%d", idx);
    NSLog(@"%@", self.pages);
    
    // Show a page in the background if this isn't the last page
    self.pageInBackground.hidden = (idx == [self.pages count]-1);
}

- (BOOL)addNewHintWithTitle:(NSString *)title andText:(NSString *)text
{
    return [self addNewHintWithController:[[BGKVSingleHintViewController alloc] initWithTitle:title andText:text]];
}

- (BOOL)addNewHintWithController:(UIViewController *)controller
{
    if ([self.pages containsObject:controller]) {
        return NO;
    }
    
    UIViewController *previousPage = [[UIViewController alloc] init];
    if ([self.pages count] == 0) {
        previousPage.view.backgroundColor = [UIColor clearColor];
    } else {
        previousPage.view.backgroundColor = [UIColor whiteColor];
        [self addShadow:previousPage.view];
    }
    
    [self addShadow:controller.view];
    
    [self.pages addObject:previousPage];
    [self.pages addObject:controller];
    [_pageViewController setViewControllers:@[previousPage, controller] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    return YES;
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
    return [self.pages indexOfObject:[self currentPageVC]];
}

- (UIViewController *)currentPageVC
{
    return [_pageViewController.viewControllers lastObject];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed) {
        [self updateIndicators];
    }
}

- (void)addShadow:(UIView *)view
{
    view.clipsToBounds = NO;
    view.layer.shadowRadius = 5;
    view.layer.shadowOffset = CGSizeMake(5, 5);
    view.layer.shadowOpacity = 0.5;
}

@end
