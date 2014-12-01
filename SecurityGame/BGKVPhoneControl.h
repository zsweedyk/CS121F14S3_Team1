//
//  BGKVPhoneControl.h
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVPhoneControl : UIControl

- (void)enterPassword:(NSString *)guess;

@property (nonatomic) NSString *password;

@property (nonatomic) NSString *guess;
@property (nonatomic) BOOL correct;
@property (nonatomic) NSNumber *attempts;

@end
