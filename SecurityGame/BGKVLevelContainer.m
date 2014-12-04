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
#import "UIViewController+Unwind.h"

// Only to avoid 'undeclared selector "goToMainMenu"'
#import "BGKVViewController.h"

#import "UIView+Scaling.h"

@interface BGKVLevelContainer ()

@end

@implementation BGKVLevelContainer {
    dispatch_once_t _initialized_token;
}

- (IBAction)returnToLevelContainer:(id)sender
{
    
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
- (void)setupHints
{
    self.hintVC = [[BGKVHintViewController alloc] init];
    self.hintButton.enabled = YES;
    [self setNewHintAvailable:YES];
}

- (IBAction)hintButtonAction:(UIBarButtonItem *)sender
{
    NSAssert([self.hintVC.pages count] > 0, @"Must have hints to view hints!");
    NSAssert(self.hintButton.enabled, @"Expected hint button to be enabled if hints are being viewed!");
    
    [self presentViewController:self.hintVC animated:YES completion:^{
        [self setNewHintAvailable:NO];
    }];
}



/*
- (void)setHintButtonEnabled:(BOOL)enabled
{
    self.hintButton.enabled = enabled;
}
 */
- (void)setNewHintAvailable:(BOOL)newHintAvailable
{
    if (newHintAvailable) {
        NSAssert(self.hintButton.enabled, @"If a new hint is available, hint button should be enabled!");
        self.hintButton.title = @"New Info!";
        [self.hintButton setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName: [UIColor blueColor]
                                                  } forState:UIControlStateNormal];
    } else {
        self.hintButton.title = @" Mission ";
        [self.hintButton setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName: [UIColor blackColor]
                                                  } forState:UIControlStateNormal];
    }
}

- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text
{
    [self.hintVC addNewHintWithTitle:title andText:text];
    self.hintButton.enabled = YES;
}
- (void)addNewHintWithController:(UIViewController *)controller
{
    [self.hintVC addNewHintWithController:controller];
    self.hintButton.enabled = YES;
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
             @"Mission Info",
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
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // This selector is declared in BGKVViewController
                [self unwind:@selector(goToMainMenu:)];
            });
            
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
            NSString *expectedButtonTitle = @"Mission Info";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            if (self.hintButton.enabled) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self hintButtonAction:nil];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView * alert = [[UIAlertView alloc]
                                           initWithTitle:@"Not Available"
                                           message:@"No mission info is currently available. Good luck!"
                                           
                                           // By setting delegate:self, dismissing this alert will run "alertView:clickedButtonAtIndex:"
                                           delegate:nil
                                           
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                });
            }
            
            break;
        }
        case 4: {
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

    dispatch_once(&_initialized_token, ^{
        [self setupHints];
        [self showInitialLevelViewController];
        
        self.menuButton.badgeValue = @"HELLO?";
    });
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

#pragma mark MAGIC STRING WARNING : initial
// "initial" is the identifier of the segue that links the LevelContainer to its first scene.
- (void)showInitialLevelViewController
{
    [self performSegueWithIdentifier:@"initial" sender:self];
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

- (void)resizeViewToFitLevelView:(UIView *)view
{
    [view ensureLandscape];
    [view scaleToFrame:self.levelView.bounds];
}

@end
