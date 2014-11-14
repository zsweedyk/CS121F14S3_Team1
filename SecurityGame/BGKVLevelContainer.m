//
//  BGKVLevelContainer.m
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelContainer.h"
#import "BGKVLevelViewController.h"
#import "BGKVLevelViewControllerCache.h"
//#import "BGKVHintViewController.h"

@interface BGKVLevelContainer ()

@end

@implementation BGKVLevelContainer {
    BGKVLevelViewControllerCache *_cache;
//    BGKVHintViewController *_hintVC;
}

#pragma mark -
#pragma mark Custom Property Getters

- (NSString *)initialSegueName
{
    if (! _initialSegueName) {
        _initialSegueName = @"initial";
    }
    return _initialSegueName;
}

- (BGKVLevelContainer *)levelContainer
{
    return self;
}

#pragma mark -
#pragma mark Hint Button
- (IBAction)hintButtonAction:(UIBarButtonItem *)sender
{
//    [self presentViewController:_hintVC animated:YES completion:^{
//        [self setNewHintAvailable:NO];
//    }];
}
- (void)setHintButtonEnabled:(BOOL)enabled
{
    self.hintButton.enabled = enabled;
}
- (void)setNewHintAvailable:(BOOL)newHintAvailable
{
    self.hintButton.style = (newHintAvailable ?
                              UIBarButtonItemStyleDone
                             :UIBarButtonItemStyleBordered);
}

#pragma mark Back Button

- (IBAction)backButtonAction:(UIBarButtonItem *)sender
{
    // Back button should not be active if the level view has nowhere to go back to
    NSAssert(self.currentLevelVC.backSegueName, @"Back button activated when level view has no back segue.");
    
    [self.currentLevelVC performSegueWithIdentifier:self.currentLevelVC.backSegueName sender:sender];
}
- (void)setBackButtonEnabled:(BOOL)enabled
{
    self.backButton.enabled = enabled;
}

#pragma mark Menu Button

- (IBAction)menuButtonAction:(UIBarButtonItem *)sender
{
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"Options Menu" delegate:self cancelButtonTitle:@"Resume" destructiveButtonTitle:nil otherButtonTitles:
             @"Quit Game",
             @"How to play",
             @"Reset Level",
             @"Settings", nil];
    menu.tag = 1;
    [menu showInView:self.view];
}
- (void)actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: {
            NSString *expectedButtonTitle = @"Quit Game";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %d was expected to be '%@', was actually '%@'",
                     actionSheet, buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            // This is to fix an issue with iOS, help from
            // http://stackoverflow.com/questions/24854802/presenting-a-view-controller-modally-from-an-action-sheets-delegate-in-ios8
            // It MAY OR MAY NOT be necessary.
            // It was in Sudoku, but it seems to work even without the dispatch_async here.
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self performSegueWithIdentifier:@"goToMainMenu" sender:self];
            });
            break;
        }
        case 1: {
            break;
        }
        case 2: {
            NSString *expectedButtonTitle = @"Reset Level";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %d was expected to be '%@', was actually '%@'",
                     actionSheet, buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            [self resetCache];
            [self showInitialLevelViewController];
            
            break;
        }
        case 3: {
            break;
        }
        default: {
            break;
        }
    }
}

#pragma mark -
#pragma mark Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // I don't think this method ever gets called ...
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (! self.currentLevelVC) {
        [self showInitialLevelViewController];
    }
    [self maskLevelView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)maskLevelView
{
    // From StackOverflow
    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = self.levelView.bounds;
    
    // Create a path with the rectangle in it.
    CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
    
    // Set the path to the mask layer.
    maskLayer.path = path;
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    // Set the mask of the view.
    self.levelView.layer.mask = maskLayer;
}

#pragma mark -
#pragma mark Caching

- (BGKVLevelViewController *)representativeForController:(BGKVLevelViewController *)controller
{
    if (! _cache) {
        _cache = [[BGKVLevelViewControllerCache alloc] init];
    }
    
    return [_cache representativeForController:controller];
}

- (void)resetCache
{
//    if (_cache) {
//        [_cache resetCache];
//    }
    _cache = nil;
}

/*
### Reference for Animation ###
 
 -(void)moveToNewController:(BGKVLevelViewController *) newController
 {
    BGKVLevelViewController *currentVC = self.currentVC;
    NSLog(@"Moving to new controller!");
    BGKVLevelViewController *currentVC = self.currentVC;
    NSAssert(currentVC, @"Tried to switch views before having one");
    [currentVC willMoveToParentViewController:nil];
    [self resizeVCViewToContainer:newController];
    [self transitionFromViewController:currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil
        completion:^(BOOL finished) {
            [currentVC removeFromParentViewController];
            currentVC.levelMaster = nil;
            [newController didMoveToParentViewController:self];
            newController.levelMaster = self;
        }];
 
 }
 */

#pragma mark -
#pragma mark Switching Level Views

- (void)showInitialLevelViewController
{
    [self performSegueWithIdentifier:self.initialSegueName sender:nil];
}

- (void)showLevelViewController:(BGKVLevelViewController *)newVC
{
    BGKVLevelViewController *oldVC = self.currentLevelVC;
    
    // If one exists, remove previous level view controller
    if (oldVC) {
        [oldVC removeFromParentViewController];
        [oldVC.view removeFromSuperview];
        oldVC.levelContainer = nil;
    }
    
    // Put the (possibly cached) controller in place
    newVC = [self representativeForController:newVC];
    [self resizeViewToFitLevelView:newVC.view];
    
    [self addChildViewController: newVC];
    [self.levelView addSubview: newVC.view];
    self.currentLevelVC = newVC;

    [self setBackButtonEnabled: (self.currentLevelVC.backSegueName ? YES : NO)];

    newVC.levelContainer = self;
}

/*
- (BOOL)hideCurrentLevelViewController
{
    // Returns YES if there was one to hide,
    // returns NO but is still successful otherwise
    
    BGKVLevelViewController *oldVC = self.currentLevelVC;
 
    // If one exists, remove previous level view controller
    if (oldVC) {
        [oldVC removeFromParentViewController];
        [oldVC.view removeFromSuperview];
        oldVC.levelContainer = nil;
        return YES;
    }
    
    return NO;
}
*/

- (void)resizeViewToFitLevelView:(UIView *)view
{
    view.frame = [BGKVLevelContainer frameInLandscape:view.frame];
    
    if (! CGRectEqualToRect(view.bounds, self.levelView.bounds)) {
        CGFloat sx = CGRectGetWidth(self.levelView.bounds) / CGRectGetWidth(view.bounds);
        CGFloat sy = CGRectGetHeight(self.levelView.bounds) / CGRectGetHeight(view.bounds);
        
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, sx, sy);
    }
    
    view.frame = CGRectMake(0,0, view.frame.size.width, view.frame.size.height);
}

+ (CGRect) frameInLandscape:(CGRect)frame
{
    // This is a rudimentary way to check if the frame is in portrait mode.
    // If so, return a transpose of the frame.
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame = CGRectMake(frame.origin.y, frame.origin.x,
                           frame.size.height, frame.size.width);
    }
    return frame;
}

@end
