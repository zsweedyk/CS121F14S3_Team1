//
//  BGKVLevelViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVLevelContainer;
@class BGKVPasswordControl;

@interface BGKVLevelViewController : UIViewController

@property (nonatomic) BOOL back;
@property (nonatomic) NSString *cacheKey;
@property (nonatomic) NSString *password;

@property (nonatomic, weak) BGKVLevelContainer *levelContainer;

- (IBAction)enterPassword:(BGKVPasswordControl *)control;
- (IBAction)enterPasswordFromTextField:(UITextField *)textField;

- (BOOL)checkPassword:(NSString *)guess;
- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender;

@end
