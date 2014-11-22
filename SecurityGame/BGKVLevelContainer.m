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
#import "BGKVHintViewController.h"
#import "UIBarButtonItem+Badge.h"

// Only to avoid 'undeclared selector "goToMainMenu"'
#import "BGKVViewController.h"

@interface BGKVLevelContainer ()

@end

@implementation BGKVLevelContainer {
    dispatch_once_t _initialized_token;
}

#pragma mark -
#pragma mark Custom Property Getters

- (BGKVLevelContainer *)levelContainer
{
    return self;
}

#pragma mark -
#pragma mark Hints
#pragma mark MAGIC STRING WARNING : hints
- (void)initializeHints
{
    @try {
        //self.hintVC = [self.storyboard instantiateViewControllerWithIdentifier:self.hintControllerName];
        self.hintVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hints"];
        [self.hintVC initialize];
        self.hintButton.enabled = YES;
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInvalidArgumentException])
        {
            self.hintButton.enabled = NO;
        }
        else
        {
            @throw;
        }
    }
}

- (IBAction)hintButtonAction:(UIBarButtonItem *)sender
{
    NSAssert(self.hintVC, @"Must have a HintViewController to view hints!");
    
    [self presentViewController:self.hintVC animated:YES completion:^{
        [self setNewHintAvailable:NO];
    }];
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

- (BOOL)makeHintAtIndexAvailable:(int)index
{
    BOOL changedAvailability = [self.hintVC makeHintAtIndexAvailable:index];
    [self setNewHintAvailable:changedAvailability];
    return changedAvailability;
}

#pragma mark Back Button
#pragma mark MAGIC STRING WARNING : back
// "back" is the identifier of the segue that links a scene to another, that is followed when the back button is pressed
- (IBAction)backButtonAction:(UIBarButtonItem *)sender
{
    // Back button should not be active if the level view has nowhere to go back to
    //NSAssert(self.currentLevelVC.backSegueName, @"Back button activated when level view has no back segue.");
    
    //[self.currentLevelVC performSegueWithIdentifier:self.currentLevelVC.backSegueName sender:sender];
    
    //[self.currentLevelVC performSegueWithIdentifier:@"back" sender:sender];
    @try {
        //self.hintVC = [self.storyboard instantiateViewControllerWithIdentifier:self.hintControllerName];
        [self.currentLevelVC performSegueWithIdentifier:@"back" sender:sender];
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInvalidArgumentException])
        {
            [self showInitialLevelViewController];
        }
        else
        {
            @throw;
        }
    }
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
    //menu.tag = 1;
    [menu showInView:self.view];
}
- (void)actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: {
            NSString *expectedButtonTitle = @"Quit Game";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            // This selector is declared in BGKVViewController
            UIViewController *mainMenuVC = [self targetForAction:@selector(goToMainMenu:) withSender:self];
            [mainMenuVC dismissViewControllerAnimated:YES completion:nil];
            
            break;
        }
        case 1: {
            break;
        }
        case 2: {
            NSString *expectedButtonTitle = @"Reset Level";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // I don't know what initializer to use since it's from storyboard.
    // initWithCoder is likely, but apparently it's possible to be called
    // more than once? Either way, for now this works fine.
    
    dispatch_once(&_initialized_token, ^{
        //if (! self.hintControllerName) { self.hintControllerName = @"hints"; }
        //if (! self.initialSegueName) { self.initialSegueName = @"initial"; }
        
        // Not working!
        // self.menuButton.badgeValue = @"HELLO?";
        
        [self initializeHints];
        [self maskLevelView];
        [self showInitialLevelViewController];
    });
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
    if (! self.cache) {
        self.cache = [[BGKVLevelViewControllerCache alloc] init];
    }
    
    return [self.cache representativeForController:controller];
}

- (void)resetCache
{
//    if (_cache) {
//        [_cache resetCache];
//    }
    self.cache = nil;
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

#pragma mark MAGIC STRING WARNING : intial
// "intial" is the identifier of the segue that links the LevelContainer to its first scene.
- (void)showInitialLevelViewController
{
    [self performSegueWithIdentifier:@"initial" sender:self];
    /*
    @try {
        //[self performSegueWithIdentifier:self.initialSegueName sender:nil];
        [self performSegueWithIdentifier:@"initial" sender:nil];
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInvalidArgumentException])
        {
            // Then, I suppose there isn't any initial view controller!
            // Very odd!
            NSLog(@"No initial view controller");
        }
        else
        {
            @throw;
        }
    }
     */
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

    //[self setBackButtonEnabled: (self.currentLevelVC.backSegueName ? YES : NO)];
    [self setBackButtonEnabled: self.currentLevelVC.back];

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
