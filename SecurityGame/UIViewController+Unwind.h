//
//  UIViewController+Unwind.h
//  SecurityGame
//
//  Created by Matt Valentine on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Unwind)

// Various tools for programmtic unwind segues.

- (void)unwind:(SEL)selector;

- (IBAction)dismissSelfSegue:(UIStoryboardSegue *)segue;
- (IBAction)dismissSelf;
- (void)dismissSelfCompletion:(void (^)())completion;

@end
