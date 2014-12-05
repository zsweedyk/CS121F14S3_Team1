//
//  BGKVCutsceneViewController.m
//  SecurityGame
//
//  Created by Josh Kutsko on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneViewController.h"
#import "BGKVCutsceneModel.h"
#import "BGKVLevelContainer.h"
#import "BGKVViewController.h"
#import "UIViewController+Unwind.h"

@interface BGKVCutsceneViewController ()

@end

@implementation BGKVCutsceneViewController {
    BGKVCutsceneModel *_dialogue;
    NSUInteger _dialogueIndex;
}

+ (BOOL)playCutsceneOnViewController:(UIViewController *)vc ForLevel:(NSInteger)level
{
    BGKVCutsceneViewController *cutscene = [[BGKVCutsceneViewController alloc] initWithLevel:level];
    if (cutscene) {
        [vc presentViewController:cutscene animated:YES completion:nil];
        return YES;
    }
    return NO;
}

- (IBAction)goToLevelContainer:(id)sender
{
    [self unwind:@selector(returnToLevelContainer:)];
}

- (instancetype)initWithLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        _dialogue = [[BGKVCutsceneModel alloc] initForLevel:level];
        if (!_dialogue) {
            return nil;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateDialogue];
}

- (IBAction)continueButton:(id)sender
{
    _dialogueIndex++;
    [self updateDialogue];
}

- (void)updateDialogue
{
    BOOL talkerIsHacker = (_dialogueIndex % 2 == 0);
    NSString *dialogue = [_dialogue dialogueAtIndex:_dialogueIndex];
    
    self.hackerTextField.text = talkerIsHacker ? dialogue : @"";
    self.hackerImage.hidden = !talkerIsHacker;
    self.hackerTextField.hidden = !talkerIsHacker;
    
    self.bossTextField.text = talkerIsHacker ? @"" : dialogue;
    self.bossImage.hidden = talkerIsHacker;
    self.bossTextField.hidden = talkerIsHacker;
    
    if (_dialogueIndex == [_dialogue count]-1) {
        self.continueButton.hidden = YES;
        if (self.isFinalCutscene) {
            self.playLevelButton.titleLabel.text = @"You Win!";
            [self.playLevelButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
            [self.playLevelButton addTarget:self action:@selector(endGame) forControlEvents:UIControlEventTouchUpInside];
        }
        self.playLevelButton.hidden = NO;
    }
}

- (void)setIsFinalCutscene:(BOOL)isFinalCutscene
{
    _isFinalCutscene = isFinalCutscene;
    if (isFinalCutscene) {
        _dialogue = [[BGKVCutsceneModel alloc] initForLastLevel];
    }
}

- (void)endGame
{
    [self unwind:@selector(goToMainMenu:)];
}

@end
