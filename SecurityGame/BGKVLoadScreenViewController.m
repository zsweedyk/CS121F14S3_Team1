//
//  BGKVLoadScreenViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLoadScreenViewController.h"
#import "UIViewController+Unwind.h"
#import "BGKVLevelContainer.h"
#import "BGKVCutsceneViewController.h"

@interface BGKVLoadScreenViewController ()

@end

@implementation BGKVLoadScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextLevelButton.hidden = YES;
    [self.nextLevelButton addTarget:self action:@selector(returnToLevelContainerAndGoToNextLevel) forControlEvents:UIControlEventTouchUpInside];
    self.spinner.hidesWhenStopped = YES;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    
    // Used from https://agilewarrior.wordpress.com/2012/04/03/how-to-display-uiactivityindicatorview-spinner-for-long-running-operations/
    // how we stop refresh from freezing the main UI thread
    dispatch_queue_t downloadQueue = dispatch_queue_create("spinningwheel", NULL);
    dispatch_async(downloadQueue, ^{
        
        // do our long running process here
        [NSThread sleepForTimeInterval:6];
        
        // do any UI stuff on the main UI thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            self.nextLevelButton.hidden = NO;
        });
        
    });
}

- (void)returnToLevelContainerAndGoToNextLevel
{
    BGKVLevelContainer *container = [self targetForAction:@selector(returnToLevelContainer:) withSender:self];
    NSInteger nextLevel = container.level+1;
    [container goToLevel:nextLevel andPlayCutscene:NO];
    
    if ([BGKVCutsceneViewController playCutsceneOnViewController:self ForLevel:nextLevel]) {
        // Do nothing; the cutscene will take care of returning to the level container
    } else {
        [self unwind:@selector(returnToLevelContainer:)];
    }
}

@end
