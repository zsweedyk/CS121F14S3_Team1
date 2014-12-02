//
//  BGKVPasswordControl.h
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//


/*
 * An abstract class that is subclassed to make UIControls that take passwords.
 */

#import <UIKit/UIKit.h>

@class BGKVPasswordControlController;

@interface BGKVPasswordControl : UIControl

- (void)reset;
- (void)setup;
- (void)enterPassword:(NSString *)guess;

@property (nonatomic) NSString *password;
@property (nonatomic) NSString *guess;
@property (nonatomic) BOOL correct;
@property (nonatomic) NSNumber *attempts;

@end
