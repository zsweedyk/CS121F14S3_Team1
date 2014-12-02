//
//  BGKVCrackerKeyboard.h
//  SecurityGame
//
//  Created by Guest User on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVCrackerKeyboard : UIView

- (instancetype)initDefault;

@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) id<UITextInput> delegate;

@end
