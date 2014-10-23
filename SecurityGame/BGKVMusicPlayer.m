//
//  BGKVMusicPlayer.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 10/22/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVMusicPlayer.h"

@interface BGKVMusicPlayer () {
    BOOL _isPlaying;
}
@end

@implementation BGKVMusicPlayer

// FIX ME: How to handle not reinitializing the same view multiple times.
// FIX ME: All of the views always persist. That doesn't seem right. Need to
//         pop and push views on and off properly, or preload them.

+ (BGKVMusicPlayer*) sharedInstance
{
    // http://www.raywenderlich.com/46988/ios-design-patterns
    static BGKVMusicPlayer* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[BGKVMusicPlayer alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        // From StackOverflow on how to play music
        NSURL *musicFile = [[NSBundle mainBundle] URLForResource:@"spy_music"
                                                       withExtension:@"mp3"];
        self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile
                                                                          error:nil];
        self.backgroundMusic.numberOfLoops = -1;
        _isPlaying = false;
    }
    
    return self;
}

- (void) play
{
    if (!_isPlaying) {
        [self.backgroundMusic play];
        _isPlaying = true;
    }
}

@end
