//
//  BGKVViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVViewController.h"

@interface BGKVViewController ()

@end

@implementation BGKVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // FIX ME: How to handle not reinitializing the same view multiple times.
    // FIX ME: All of the views always persist. That doesn't seem right. Need to
    //         pop and push views on and off properly, or preload them.

    // From StackOverflow on how to play music
//    NSURL *musicFile = [[NSBundle mainBundle] URLForResource:@"spy_music"
//                                               withExtension:@"mp3"];
//    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile
//                                                                  error:nil];
//    self.backgroundMusic.numberOfLoops = -1;
//    [self.backgroundMusic play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) goToMainMenu:(UIStoryboardSegue *)segue {
    
}
@end
