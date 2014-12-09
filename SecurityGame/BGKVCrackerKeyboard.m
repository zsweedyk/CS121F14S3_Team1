//
//  BGKVCrackerKeyboard.m
//  SecurityGame
//
//  Created by Matt Valentine on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCrackerKeyboard.h"



@implementation BGKVCrackerKeyboard
    
- (instancetype) initDefault {
    return [self initWithFrame:CGRectMake(0, 0, 1024, 352)];
}

- (id<UITextInput>) delegate {
    if (!_delegate) {
        return self.textField;
    }
    return _delegate;
}

- (void)setTextField:(UITextField *)tf {
    _textField = tf;
    _textField.inputView = self;
}

- (IBAction)dataPress:(UIButton *)btn {
    NSString *text;
    
    switch (btn.tag) {
        case 1: {
            text = @"a";
            break;
        }
        case 2: {
            text = @"A";
            break;
        }
        case 3: {
            text = @"1";
            break;
        }
        case 4: {
            text = @"!";
            break;
        }
            
        default: {
            text = btn.titleLabel.text;
            break;
        }
    }
    
    [self.delegate insertText:text];
}

- (IBAction)backPress {
    if ([self.delegate conformsToProtocol:@protocol(UITextInput)]) {
        [self.delegate deleteBackward];
    } else {
        NSUInteger nLen = [_textField.text length];
        if (nLen)
            _textField.text = [_textField.text substringToIndex:nLen-1];
    }
}

- (IBAction)enterPress {
    [_textField.delegate textFieldShouldReturn:_textField];
}

- (IBAction)dismissPress {
    [_textField resignFirstResponder];
}

- (UIView *)loadWithNIB {
    NSArray *aNib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    UIView *view = [aNib objectAtIndex:0];
    [self addSubview:view];
    return view;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
        [self loadWithNIB];
    return self;
}
@end
