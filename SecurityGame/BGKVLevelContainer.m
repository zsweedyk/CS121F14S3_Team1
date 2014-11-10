//
//  BGKVLevelContainer.m
//  SecurityGame
//
//  Created by Guest User on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelContainer.h"
#import "BGKVLevelViewController.h"

@interface BGKVLevelContainer ()

@end

@implementation BGKVLevelContainer

NSString *_initialSegueName = @"Initial Level View";

- (BGKVLevelContainer *)levelContainer
{
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"Initializing...");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    NSLog(@"Done.");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (! self.currentLevelVC) {
        [self showInitialLevelViewController];
    }
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

- (void)showInitialLevelViewController
{
    NSLog(@"Showing initial...");
    [self performSegueWithIdentifier:_initialSegueName sender:nil];
    NSLog(@"Done.");
}

- (void)showLevelViewController:(BGKVLevelViewController *)newVC
{
    NSLog(@"Showing controller %@...", newVC);
    BGKVLevelViewController *oldVC = self.currentLevelVC;
 
    if (oldVC) {
        NSLog(@"\tRemoving controller %@...", oldVC);
        [oldVC removeFromParentViewController];
        [oldVC.view removeFromSuperview];
        oldVC.levelContainer = nil;
        NSLog(@"\tDone.");
    }
    
    //[self resizeViewToFitLevelView:newVC.view];
    
    [self addChildViewController: newVC];
    [self.levelView addSubview: newVC.view];
    newVC.levelContainer = self;
    NSLog(@"Done.");
}

- (void)resizeViewToFitLevelView:(UIView *)view
{
    view.frame = [BGKVLevelContainer frameInLandscape:view.frame];
    
    CGFloat sx = CGRectGetWidth(self.levelView.bounds) / CGRectGetWidth(view.bounds);
    CGFloat sy = CGRectGetHeight(self.levelView.bounds) / CGRectGetWidth(view.bounds);
    
    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, sx, sy);
    
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
