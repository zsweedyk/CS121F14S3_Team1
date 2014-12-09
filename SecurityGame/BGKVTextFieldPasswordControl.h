//
//  BGKVTextFieldPasswordControl.h
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPasswordControl.h"

@interface BGKVTextFieldPasswordControl : BGKVPasswordControl <UITextFieldDelegate>

@property (nonatomic) UITextField *passwordField;

@end
