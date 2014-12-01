//
//  BGKVViewController2Temp.h
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVPasswordControlController.h"

@class BGKVPasswordControl;

@interface BGKVPhoneControlController : BGKVPasswordControlController

- (IBAction)pushIPhoneButton:(UIButton *)sender;

@property (nonatomic) IBOutletCollection(UIImageView) NSArray *passwordCharacterEnteredIcons;

@end
