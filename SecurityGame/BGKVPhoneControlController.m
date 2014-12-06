//
//  BGKVViewController2Temp.m
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPhoneControlController.h"
#import "BGKVPasswordControl.h"

@interface BGKVPhoneControlController ()

@end

@implementation BGKVPhoneControlController {
    BOOL _deactivated; // Might be unnecessary. Probably is.
    NSMutableString *_password;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}

- (void)reset
{
    _password = nil;
    for(UIImageView *icon in self.passwordCharacterEnteredIcons) {
        icon.hidden = YES;
    }
}

- (IBAction)resetPhone:(UIButton *)sender
{
    [self reset];
}

- (void)enterDigit:(NSInteger)digit
{
    NSAssert(_password.length < 4, @"Tried to add to password when password already full!");
    NSAssert(0 <= digit && digit <=9, @"Tried to add a number larger than a digit: %ld", (long)digit);
    [_password appendFormat:@"%ld", (long)digit];
}

- (IBAction)pushIPhoneButton:(UIButton *)sender
{
    if (self.passwordCharacterEnteredIcons) {
        NSAssert([self.passwordCharacterEnteredIcons count] == 4, @"Level5 Password Controller expected 4 character_entered_icons (or nil)");
    }
    
    if (! _password) {
        _password = [[NSMutableString alloc] init];
    }
    
    // Hmm, could there be a problem if buttons are mashed
    // and the order gets mixed up?
    
    if (! _deactivated) {
        [self enterDigit:sender.tag];
        
        if (self.passwordCharacterEnteredIcons) {
            UIControl *icon = self.passwordCharacterEnteredIcons[_password.length - 1];
            icon.hidden = NO;
        }
        
        if (_password.length == 4) {
            [self enterPassword];
        }
    }
}

- (void)enterPassword
{
    [self.parentControl enterPassword:_password];
}


@end
