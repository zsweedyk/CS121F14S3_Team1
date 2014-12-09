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
    // Initializes the cutscene with the level of the current viewController
    BGKVCutsceneViewController *cutscene = [[BGKVCutsceneViewController alloc] initWithLevel:level];
    if (cutscene) {
        [vc presentViewController:cutscene animated:YES completion:nil];
        return YES;
    }
    return NO;
}

- (IBAction)goToLevelContainer:(id)sender
{
    // Executed when the cutscene is done
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
    [self updateDialogue]; // Makes sure the first dialogue is loaded
}

- (IBAction)continueButton:(id)sender
{
    // Progresses to the next level of cutscene
    _dialogueIndex++;
    [self updateDialogue];
}

- (void)updateDialogue
{
    // http://stackoverflow.com/questions/19049917/uitextview-font-is-being-reset-after-settext
    // For some silly reason, changing the content of a textfield always changes the font size and color
    // Making it selectable fixes it. We then disable selectable after the update.
    self.hackerTextField.selectable = YES;
    self.bossTextField.selectable = YES;
    // Figure out who is talking, and then get the dialogue
    BOOL talkerIsHacker = (_dialogueIndex % 2 == 0);
    NSString *dialogue = [_dialogue dialogueAtIndex:_dialogueIndex];
    
    // Update the text and the images for the current talker
    self.hackerTextField.text = talkerIsHacker ? dialogue : @"";
    self.hackerImage.hidden = !talkerIsHacker;
    self.hackerTextField.hidden = !talkerIsHacker;
    
    self.bossTextField.text = talkerIsHacker ? @"" : dialogue;
    self.bossImage.hidden = talkerIsHacker;
    self.bossTextField.hidden = talkerIsHacker;
    
    self.hackerTextField.selectable = NO;
    self.bossTextField.selectable = NO;
    
    // Check if the current dialogue is the last in the cutscene
    if (_dialogueIndex == [_dialogue count]-1) {
        self.continueButton.hidden = YES;
        if (self.isFinalCutscene) { //Game over
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
