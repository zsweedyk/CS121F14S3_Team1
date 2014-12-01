//
//  BGKVPasswordControlController.h
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVPasswordControl;

@interface BGKVPasswordControlController : UIViewController

- (void)reset;

@property (nonatomic, weak) BGKVPasswordControl *parentControl;

@end
