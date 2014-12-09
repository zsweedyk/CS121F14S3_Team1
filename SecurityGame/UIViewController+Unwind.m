//
//  UIViewController+Unwind.m
//  SecurityGame
//
//  Created by Matt Valentine on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "UIViewController+Unwind.h"

@implementation UIViewController (Unwind)

- (void)unwind:(SEL)selector
{
    UIViewController *destination = [self targetForAction:selector withSender:self];
    [destination dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissSelfSegue:(UIStoryboardSegue *)segue { }

- (IBAction)dismissSelf
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissSelfCompletion:(void (^)())completion
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:completion];
}

@end
