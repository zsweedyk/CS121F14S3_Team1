//
//  BGKVCrackerControl.h
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVTextFieldPasswordControl.h"

@interface BGKVCrackerControl : BGKVTextFieldPasswordControl

+ (NSString *)templateFromString:(NSString *)string;
+ (NSString *)randomFromTemplate:(NSString *)template;

@end
