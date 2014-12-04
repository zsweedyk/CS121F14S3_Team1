//
//  BGKVSettingsViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 12/4/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVSettingsViewController.h"
#import "BGKVMusicPlayer.h"

@interface BGKVSettingsViewController ()

@end

@implementation BGKVSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.muteMusic.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"muteMusic"];
    // Default is 0
    self.volumeLevel.value = 1 - [[NSUserDefaults standardUserDefaults] floatForKey:@"volumeLevel"];
    self.unlockLevels.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"unlockLevels"];
}

- (IBAction)muteMusicChanged:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:self.muteMusic.on forKey:@"muteMusic"];
    if (self.muteMusic.on) {
        [[BGKVMusicPlayer sharedInstance] mute];
        self.volumeLevel.enabled = false;
    } else {
        [[BGKVMusicPlayer sharedInstance] unmute];
        self.volumeLevel.enabled = true;
    }
}

- (IBAction)volumeLevelChanged:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setFloat:(1-self.volumeLevel.value) forKey:@"volumeLevel"];
    [[BGKVMusicPlayer sharedInstance] setVolume:self.volumeLevel.value];
}

- (IBAction)unlockLevelsChanged:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:self.unlockLevels.on forKey:@"unlockLevels"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
