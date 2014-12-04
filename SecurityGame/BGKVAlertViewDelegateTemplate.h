//
//  BGKVAlertViewDelegateTemplate.h
//  SecurityGame
//
//  Created by Guest User on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVAlertViewDelegateTemplate : NSObject <UIAlertViewDelegate>

+ (void)setActionOfAlertView:(UIAlertView *)alert toAction:(void (^)())action;

- (instancetype)initWithAction:(void (^)())action;

@end
