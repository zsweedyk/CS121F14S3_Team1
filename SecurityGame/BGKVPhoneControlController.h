//
//  BGKVViewController2Temp.h
//  SecurityGame
//
//  Created by Guest User on 11/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGKVPasswordControl;

@interface BGKVPhoneControlController : UIViewController

- (IBAction)pushIPhoneButton:(UIButton *)sender;
- (IBAction)resetPhone:(UIButton *)sender;
- (void)reset;

@property (nonatomic, weak) BGKVPasswordControl *parentControl;
@property (nonatomic) IBOutletCollection(UIImageView) NSArray *passwordCharacterEnteredIcons;

@end
