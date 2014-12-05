//
//  BGKVSettingsViewController.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch* muteMusic;
@property (weak, nonatomic) IBOutlet UISlider* volumeLevel;

@end
