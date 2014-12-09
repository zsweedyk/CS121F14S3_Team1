//
//  BGKVPasswordControl.h
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

// Typically this class will only be subclassed, not instantiated.
// If instantiated, it's functional, but doesn't have any way to take in input.

@class BGKVPasswordControlController;

@interface BGKVPasswordControl : UIControl

- (void)reset;
- (void)setup;
- (void)enterPassword:(NSString *)guess;

@property (nonatomic) NSString *password;
@property (nonatomic) NSString *guess;
@property (nonatomic) BOOL correct;
@property (nonatomic) NSInteger attempts;

@end
