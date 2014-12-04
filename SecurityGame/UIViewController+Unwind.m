//
//  UIViewController+Unwind.m
//  SecurityGame
//
//  Created by Guest User on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "UIViewController+Unwind.h"

@implementation UIViewController (Unwind)

- (void)unwind:(SEL)selector
{
    UIViewController *destination = [self targetForAction:selector withSender:self];
    [destination dismissViewControllerAnimated:YES completion:nil];
}

@end
