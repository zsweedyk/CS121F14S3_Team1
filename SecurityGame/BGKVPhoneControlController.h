//
//  BGKVViewController2Temp.h
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVPhoneControl;

@interface BGKVPhoneControlController : UIViewController

- (IBAction) pushIPhoneButton:(UIButton *)sender;
- (void) reset;

@property (nonatomic) IBOutletCollection(UIImageView) NSArray *passwordCharacterEnteredIcons;
@property (nonatomic, weak) BGKVPhoneControl *parentControl;



@end
