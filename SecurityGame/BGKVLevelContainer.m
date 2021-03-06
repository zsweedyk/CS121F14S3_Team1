//
//  BGKVLevelContainer.m
//  SecurityGame
//
//  Created by Matt Valentine on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelContainer.h"
#import "BGKVLevelViewController.h"
#import "BGKVLevelViewControllerCache.h"
#import "BGKVHintViewController.h"
#import "BGKVCutsceneViewController.h"
#import "BGKVAlertViewDelegateTemplate.h"
#import "BGKVLevelSelectViewController.h"

// Only to avoid 'undeclared selector "goToMainMenu"'
#import "BGKVViewController.h"

#import "UIView+Scaling.h"
#import "UIViewController+Unwind.h"

@interface BGKVLevelContainer ()

@end

@implementation BGKVLevelContainer {
    dispatch_once_t _initialized_token;
    dispatch_once_t _cutscene_token;
    NSDictionary *_disabledHintButtonTitleTextAttributes;
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
- (void)setupHints
{
    self.hintVC = [[BGKVHintViewController alloc] initWithLevel:self.level];
    
    self.hintButton.enabled = [self.hintVC hasHints];
    self.newHintAvailable = NO;
    [self updateHintButtonAppearance];
}

- (IBAction)hintButtonAction:(UIBarButtonItem *)sender
{
    NSAssert([self.hintVC hasHints], @"Must have hints to view hints!");
    NSAssert(self.hintButton.enabled, @"Expected hint button to be enabled if hints are being viewed!");
    
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:self.hintVC animated:YES completion:^{
        self.newHintAvailable = NO;
    }];
}


- (void)setNewHintAvailable:(BOOL)newHintAvailable
{
    _newHintAvailable = newHintAvailable;
    if (newHintAvailable) {
        self.hintButton.enabled = YES;
    }
    [self updateHintButtonAppearance];
    
}

- (void)updateHintButtonAppearance
{
    if (self.newHintAvailable && self.hintButton.enabled) {
        NSAssert(self.hintButton.enabled, @"If a new hint is available, hint button should be enabled!");
        self.hintButton.title = @"New Info!";
        [self.hintButton setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName: [UIColor blueColor]
                                                  } forState:UIControlStateNormal];
    } else if (self.hintButton.enabled) {
        self.hintButton.title = @" Mission ";
        [self.hintButton setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName: [UIColor blackColor]
                                                  } forState:UIControlStateNormal];
    } else {
        self.hintButton.title = @" Mission ";
        [self.hintButton setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName: [UIColor colorWithWhite:0 alpha:0.5]
                                                  } forState:UIControlStateNormal];
    }
}

- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text
{
    [self addNewHintWithTitle:title andText:text updateNewHintAvailable:YES];
}
- (void)addNewHintWithTitle:(NSString *)title andText:(NSString *)text updateNewHintAvailable:(BOOL)update
{
    self.hintButton.enabled = YES;
    BOOL wasANewHint = [self.hintVC addNewHintWithTitle:title andText:text];
    
    if (update && wasANewHint) {
        self.newHintAvailable = YES;
    }
}
- (void)addNewHintWithController:(UIViewController *)controller
{
    [self addNewHintWithController:controller updateNewHintAvailable:YES];
}
- (void)addNewHintWithController:(UIViewController *)controller updateNewHintAvailable:(BOOL)update
{
    self.hintButton.enabled = YES;
    BOOL wasANewHint = [self.hintVC addNewHintWithController:controller];

    if (update && wasANewHint) {
        self.newHintAvailable = YES;
    }
}

- (void)addAnyInitialHints
{
    if (!self.currentLevelVC) {
        return;
    }
    
    for (BGKVSingleHintViewController *hint in self.currentLevelVC.hints) {
        if ([hint shouldBeInitiallyAvailable]) {
            [self addNewHintWithController:hint];
        }
    }
}

#pragma mark Back Button
#pragma mark MAGIC STRING WARNING : back
// "back" is the identifier of the segue that links a scene to another, that is followed when the back button is pressed
- (IBAction)backButtonAction:(UIBarButtonItem *)sender
{
    /* // Uncomment this code if you want to have the ability to go "back" to something other than the initial scene
    @try {
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
     */
    [self showInitialLevelViewController];
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
             @"How to Play",
             @"Restart Level",
             @"Mission Info",
             @"Settings",
             @"Replay Cutscene", nil];
    [menu showInView:self.view];
}
- (void)actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"Quit Game";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView * alert = [[UIAlertView alloc]
                                       initWithTitle:@"Are you sure?"
                                       message:@"You will lose your progess on this mission if you quit!"
                                       delegate:nil
                                       
                                       cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [BGKVAlertViewDelegateTemplate setActionOfAlertView:alert toComplexAction:
                 ^(UIAlertView *alert, NSInteger index) {
                    if (index == 1) {
                        [self unwind:@selector(goToMainMenu:)];
                    }
                }];
                [alert show];
            });
            
            break;
        }
        case 1: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"How to Play";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIViewController *settings = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"About"];
                [self presentViewController:settings animated:YES completion:nil];
            });
                
            break;
        }
        case 2: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"Restart Level";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView * alert = [[UIAlertView alloc]
                                       initWithTitle:@"Are you sure?"
                                       message:@"You will lose your progess on this mission if you restart!"
                                       delegate:nil
                                       
                                       cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [BGKVAlertViewDelegateTemplate setActionOfAlertView:alert toComplexAction:
                 ^(UIAlertView *alert, NSInteger index) {
                     if (index == 1) {
                         [self reset];
                         [self setupHints];
                         [self showInitialLevelViewController];
                         [self playCutscene];
                     }
                 }];
                [alert show];
            });
            
            break;
        }
        case 3: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"Mission Info";
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
                                           delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                });
            }
            
            break;
        }
        case 4: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"Settings";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIViewController *settings = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Settings"];
                [self presentViewController:settings animated:YES completion:nil];
            });
            
            break;
        }
        case 5: {
            NSString *expectedButtonTitle;
            expectedButtonTitle = @"Replay Cutscene";
            NSAssert([expectedButtonTitle isEqualToString:[actionSheet buttonTitleAtIndex:buttonIndex]],
                     @"Action sheet %@: index %ld was expected to be '%@', was actually '%@'",
                     actionSheet, (long)buttonIndex, expectedButtonTitle, [actionSheet buttonTitleAtIndex:buttonIndex]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                BOOL played = [self playCutscene];
                if (!played) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertView * alert = [[UIAlertView alloc]
                                               initWithTitle:@"Not Available"
                                               message:@"This mission doesn't have a cutscene!"
                                               delegate:nil
                                               cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                    });
                }
            });
            
            break;
        }
        default: {
            break;
        }
    }
}

#pragma mark -
#pragma mark Initialization

- (BOOL)playCutscene
{
    return [BGKVCutsceneViewController playCutsceneOnViewController:self ForLevel:self.level];
}

- (void)reset
{
    self.cache = nil;
    self.hintVC = nil;
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

#pragma mark -
#pragma mark Switching Level Views and Levels
- (void)goToLevel:(NSInteger)level
{
    [self goToLevel:level andPlayCutscene:YES];
}

- (void)goToLevel:(NSInteger)level andPlayCutscene:(BOOL)cutscene
{
    [self reset];
    self.level = level;
    
    [self setupHints];
    [self showInitialLevelViewController];
    if (cutscene) {
        [self playCutscene];
    }
}

- (void)showInitialLevelViewController
{
    BGKVLevelViewController *initialVC = (BGKVLevelViewController *)[BGKVLevelSelectViewController initialVCForLevel:self.level];
    [self showLevelViewController:initialVC];
}

- (void)showLevelViewController:(BGKVLevelViewController *)newVC
{
    BGKVLevelViewController *oldVC = self.currentLevelVC;
    
    // If one exists, remove previous level view controller.
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
    [self setBackButtonEnabled: self.currentLevelVC.back];
    newVC.levelContainer = self;
    
    [self addAnyInitialHints];
}

- (void)resizeViewToFitLevelView:(UIView *)view
{
    [view ensureLandscape];
    [view scaleToFrame:self.levelView.bounds];
}

@end
