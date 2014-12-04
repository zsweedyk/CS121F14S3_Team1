//
//  UIView+Scaling.m
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "UIView+Scaling.h"

@implementation UIView (Scaling)

- (void)scaleToFrame:(CGRect)frame
{
    [self scaleToFrame:frame keepAspect:NO];
}

- (void)scaleToFrame:(CGRect)frame keepAspect:(BOOL)keepAspect
{
    if (! CGRectEqualToRect(self.bounds, frame)) {
        CGFloat sx = CGRectGetWidth(frame) / CGRectGetWidth(self.bounds);
        CGFloat sy = CGRectGetHeight(frame) / CGRectGetHeight(self.bounds);
        
        if (keepAspect) {
            sx = MIN(sx, sy);
            sy = MIN(sx, sy);
        }
        
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, sx, sy);
    }
    
    self.frame = CGRectMake(0,0, frame.size.width, frame.size.height);
}

- (void)ensureLandscape
{
    CGRect frame = self.frame;
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame = CGRectMake(frame.origin.y, frame.origin.x,
                           frame.size.height, frame.size.width);
        self.frame = frame;
    }
    
}

- (void)ensurePortrait
{
    CGRect frame = self.frame;
    
    if (CGRectGetWidth(frame) > CGRectGetHeight(frame)) {
        frame = CGRectMake(frame.origin.y, frame.origin.x,
                           frame.size.height, frame.size.width);
        self.frame = frame;
    }
}

@end
