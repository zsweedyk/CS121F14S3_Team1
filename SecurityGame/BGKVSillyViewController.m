//
//  BGKVSillyViewController.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVSillyViewController.h"
#import "BGKVLevelViewController.h"

@interface BGKVSillyViewController ()

@end

@implementation BGKVSillyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Aloha!");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"I'm alive!");
    [self performSegueWithIdentifier:@"InitialContentView" sender:nil];
    NSLog(@"Done performing segue!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveToNewController:(BGKVLevelViewController *) newController {
    NSLog(@"Moving to new controller!");
    BGKVLevelViewController *currentVC = self.currentVC;
    NSAssert(currentVC, @"Tried to switch views before having one");
    [currentVC willMoveToParentViewController:nil];
    [self transitionFromViewController:currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil
                            completion:^(BOOL finished) {
                                [currentVC removeFromParentViewController];
                                currentVC.levelMaster = nil;
                                [newController didMoveToParentViewController:self];
                                newController.levelMaster = self;
                            }];
    
}

-(void)presentFirstController:(BGKVLevelViewController *) firstController {
    NSLog(@"And it is the first!");
    [self addChildViewController:firstController];
    [firstController didMoveToParentViewController:self];
    firstController.view.frame = self.container.bounds;
    [self.container addSubview:firstController.view];
}

@end
