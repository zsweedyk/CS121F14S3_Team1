//
//  UIView+Scaling.h
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Scaling)

- (void)scaleToFrame:(CGRect)frame;
- (void)scaleToFrame:(CGRect)frame keepAspect:(BOOL)keepAspect;

- (void)ensureLandscape;
- (void)ensurePortrait;

@end
