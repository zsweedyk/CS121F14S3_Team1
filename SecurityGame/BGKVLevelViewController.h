//
//  BGKVLevelViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGKVPasswordControl.h"
#import "BGKVSingleHintViewController.h"

@class BGKVLevelContainer;

@interface BGKVLevelViewController : UIViewController

@property (nonatomic) BOOL back;
@property (nonatomic) NSString *cacheKey;
@property (nonatomic) NSString *password;

@property (nonatomic, weak) BGKVLevelContainer *levelContainer;

@property (nonatomic) IBOutletCollection(BGKVSingleHintViewController) NSArray *hints;

- (IBAction)enterPassword:(BGKVPasswordControl *)control;
- (IBAction)enterPasswordFromTextField:(UITextField *)textField;

- (BOOL)checkPassword:(NSString *)guess;
- (void)enteredCorrectPassword:(BOOL)correct sender:(id)sender;

@end
