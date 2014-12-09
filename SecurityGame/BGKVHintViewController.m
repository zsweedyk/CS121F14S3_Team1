//
//  BGKVHintViewController.m
//  SecurityGame
//
//  Created by Matt Valentine on 11/13/14.
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
    // Returns YES if the controller is ready to display hints.
    // That means that there are hints, and moreover there are hints displayed
    // in the pageViewController
    return _pageViewController.viewControllers && self.pages && [self.pages count] > 0;
}

- (void)setup
{
    self.pages = [[NSMutableArray alloc] init];
    
    // We want a two-sided, turn-the-page horizontal PageViewController.
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:@{UIPageViewControllerOptionSpineLocationKey: [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMid]}];
    _pageViewController.doubleSided = YES;
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    [self.view addSubview:_pageViewController.view];
}

- (instancetype)initWithLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        self.level = level;
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Double the page view width-wise, because we have two pages.
    CGRect frame = self.pageView.frame;
    _pageViewController.view.frame = CGRectMake(frame.origin.x-frame.size.width, frame.origin.y,
                                                frame.size.width*2, frame.size.height);
    
    self.missionNumberLabel.text = self.level == 0 ? @"TRAINING" : [NSString stringWithFormat:@"MISSION %ld", (long)self.level];
    // No way to rotate a label in Interface Builder, so we do it here.
    // M_PI_2 is pi / 2
    [self.missionNumberLabel sizeToFit];
    self.missionNumberLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateIndicators];
}

- (void)updateIndicators
{
    [self updateIndicatorsForPage:[self currentPageVC]];
}
- (void)updateIndicatorsForPage:(UIViewController *)page
{
    // updateIndicators changes the appearance depending on whether there are pages to
    // be seen to the left or right.
    
    NSInteger idx = [self indexOfController:page];
    
    // Show a page in the background if this isn't the last page
    self.pageInBackground.hidden = (idx == [self.pages count]-1);
    
    // Add a shadow to the either the entire pageviewcontroller, so that the page on the left
    // also has a shadow, or just the pageView, so that only the page on the right has a shadow.
    // This depends on whether there IS a visible page to the left.
    // Since the first (index 0) page is invisible, the first REAL page is index 1.
    // So we check if the index is beyond that.
    if (idx > 1) {
        [self addShadow:_pageViewController.view];
        [self removeShadow:self.pageView];
    } else {
        [self removeShadow:_pageViewController.view];
        [self addShadow:self.pageView];
    }
}

- (BOOL)addNewHintWithTitle:(NSString *)title andText:(NSString *)text
{
    return [self addNewHintWithController:[[BGKVSingleHintViewController alloc] initWithTitle:title andText:text]];
}

- (BOOL)addNewHintWithController:(UIViewController *)controller
{
    // We don't want to add the hint if there is already an equivalent one
    if ([self.pages containsObject:controller]) {
        return NO;
    }
    
    // The first "previous page" is invisible, because it is just a placeholder
    UIViewController *previousPage = [[UIViewController alloc] init];
    if ([self.pages count] == 0) {
        previousPage.view.backgroundColor = [UIColor clearColor];
    } else {
        previousPage.view.backgroundColor = [UIColor whiteColor];
    }
    
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

- (void)addShadow:(UIView *)view
{
    view.layer.masksToBounds = NO;
    view.layer.shadowRadius = 5;
    view.layer.shadowOffset = CGSizeMake(5, 5);
    view.layer.shadowOpacity = 0.5;
}
- (void)removeShadow:(UIView *)view
{
    view.layer.shadowOpacity = 0;
}

- (NSInteger)indexOfController:(UIViewController *)controller
{
    // Since we never add equivalent hints, this won't screw up.
    // This will be NSIntegerNotFound if it isn't there
    return [self.pages indexOfObject:controller];
}

#pragma mark -
#pragma mark PageViewController Delegate / DataSource methods

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [self indexOfController:[self currentPageVC]];
}

- (UIViewController *)currentPageVC
{
    return [_pageViewController.viewControllers lastObject];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    [self updateIndicators];
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    UIViewController *currentPage = [self currentPageVC];
    UIViewController *pendingPage = [pendingViewControllers lastObject];
    if ([self indexOfController:currentPage] < [self indexOfController:pendingPage]) {
        [self updateIndicatorsForPage:[pendingViewControllers lastObject]];
    }
}

@end
