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

@interface BGKVCutsceneViewController ()

@end

@implementation BGKVCutsceneViewController {
    NSArray *_dialogue;
    NSUInteger _dialogueIndex;
}

- (instancetype)initWithLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        _dialogue = [BGKVCutsceneModel dialogueForLevel:level];
        NSLog(@"%@", _dialogue);
        if (!_dialogue) {
            return nil;
        }
    }
    return self;
}

- (IBAction)continueButton:(id)sender
{
    _dialogueIndex++;
    [self updateDialogue];
}

- (void)updateDialogue
{
    BOOL talkerIsHacker = (_dialogueIndex % 2 == 0);
    
    self.hackerTextField.text = talkerIsHacker ? _dialogue[_dialogueIndex] : @"";
    self.hackerImage.hidden = !talkerIsHacker;
    self.hackerTextField.hidden = !talkerIsHacker;
    
    self.bossTextField.text = talkerIsHacker ? @"" : _dialogue[_dialogueIndex];
    self.bossImage.hidden = talkerIsHacker;
    self.bossTextField.hidden = talkerIsHacker;
    
    if (_dialogueIndex == [_dialogue count]-1) {
        self.continueButton.hidden = YES;
        self.playLevelButton.hidden = NO;
    }
}

- (IBAction)goToNextLevel
{
    BGKVLevelContainer *container = [self targetForAction:@selector(returnToLevelContainer:) withSender:self];
    [container dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateDialogue];
}

@end
