//
//  BGKVMusicPlayer.h
//  SecurityGame
//
//  Created by Hayden Blauzvern on 10/22/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

@interface BGKVMusicPlayer : NSObject

@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;

+ (BGKVMusicPlayer*) sharedInstance;
- (void) play;

@end
