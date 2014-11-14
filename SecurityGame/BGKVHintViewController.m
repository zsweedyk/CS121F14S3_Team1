//
//  BGKVHintViewController.m
//  SecurityGame
//
//  Created by Guest User on 11/13/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVHintViewController.h"
#import "UIBarButtonItem+Badge.h"

@interface BGKVHintViewController ()

@end

@implementation BGKVHintViewController {
    // Array of BOOLS
    NSMutableArray *_is_available;
    NSMutableArray *_is_viewed;
    BOOL _initialized;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSAssert(_initialized, @"Hint controller viewed without being properly initialized.");
}

- (void)initialize
{
    self.delegate = self;
    _initialized = YES;
    
    NSAssert([self.tabBar.items count] > 0, @"Hint view controller needs an initial screen");
    
    UITabBarItem *backButton = [[UITabBarItem alloc] initWithTitle:@"Back" image:nil tag:0];
    UIViewController *dummy  = [[UIViewController alloc] init];
    dummy.tabBarItem = backButton;
    
    NSMutableArray *vcs_and_done = [[NSMutableArray alloc] initWithObjects:dummy, nil];
    [vcs_and_done addObjectsFromArray:self.viewControllers];
    self.viewControllers = vcs_and_done;
    
    _is_available = [[NSMutableArray alloc] initWithObjects:@YES, @YES, nil];
    _is_viewed = [[NSMutableArray alloc] initWithObjects:@YES, @YES, nil];
    
    NSArray *items = self.tabBar.items;
    for (int i=2; i < [items count]; i++) {
        [_is_available addObject:@NO];
        [_is_viewed addObject:@NO];
        
        UITabBarItem *item = items[i];
        item.title = @"Locked";
        item.enabled = NO;
        item.tag = i;
        
        [self markHintAtIndexAsAvailable:i];
    }
    
    [self setSelectedViewController:self.viewControllers[1]];
}

- (void)markHintAtIndexAsAvailable:(int)index
{
    UITabBarItem *item = self.tabBar.items[index];
    _is_available[index] = @YES;
    item.title = [NSString stringWithFormat:@"Hint %d", index];
    item.enabled = YES;
    
    if (! [_is_viewed[index] boolValue]) {
        item.badgeValue = @"NEW";
    }
}

- (void)markHintAtIndexAsViewed:(int)index
{
    _is_viewed[index] = @YES;
    UITabBarItem *item = self.tabBar.items[index];
    item.badgeValue = nil;
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController == self.viewControllers[0]) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSAssert(viewController != self.viewControllers[0], @"Somehow shouldSelectViewController isn't doing its job.");
    int index = viewController.tabBarItem.tag;
    [self markHintAtIndexAsViewed:index];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end