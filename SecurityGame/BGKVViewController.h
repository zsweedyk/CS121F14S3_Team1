//
//  BGKVViewController.h
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;

@interface BGKVViewController : UIViewController

@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;

- (IBAction) goToMainMenu:(UIStoryboardSegue *)segue;

@end
