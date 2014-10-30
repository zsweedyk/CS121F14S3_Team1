//
//  BGKVCachedController2.h
//  SecurityGame
//
//  Created by HMC Guest on 10/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVCachedController2 : UIViewController

@property (nonatomic, readwrite) UIView *currentClientView;

- (void) cycleFromViewController: (UIViewController*) oldC
                toViewController: (UIViewController*) newC;



@end
