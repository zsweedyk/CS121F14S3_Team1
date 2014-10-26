//
//  BGKVNavigationReplaceSegue.m
//  SecurityGame
//
//  Created by Guest User on 10/25/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVNavigationReplaceSegue.h"

@implementation BGKVNavigationReplaceSegue

-(void)perform {
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    UINavigationController *navigationController = sourceViewController.navigationController;
    // Pop to root view controller (not animated) before pushing
    //[navigationController popToRootViewControllerAnimated:NO];
    //[navigationController pushViewController:destinationController animated:YES];
    [navigationController setViewControllers:@[destinationController] animated:YES];
}

@end
