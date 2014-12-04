//
//  BGKVViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVViewController.h"
#import "BGKVMusicPlayer.h"

@interface BGKVViewController ()

@end

@implementation BGKVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[BGKVMusicPlayer sharedInstance] play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToMainMenu:(UIStoryboardSegue *)segue { }

@end
