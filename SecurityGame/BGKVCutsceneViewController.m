//
//  BGKVCutsceneViewController.m
//  SecurityGame
//
//  Created by Josh Kutsko on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneViewController.h"
#import "BGKVCutsceneModel.h"

@interface BGKVCutsceneViewController ()

@end

@implementation BGKVCutsceneViewController

BGKVCutsceneModel *_model;
int _currentLevel;
int _dialogueNumber;
int _currentDialogueLevel;
NSArray* _textArray;

- (IBAction)continueButton:(id)sender
{
    [self changeBackgroundImage];
    [self updateTextFields];
    ++_currentDialogueLevel;
    if(_currentDialogueLevel == _dialogueNumber){
        self.continueButton.hidden = YES;
        self.playLevelButton.hidden = NO;
        self.playLevelButton.userInteractionEnabled = YES;
    }
}

- (void) changeBackgroundImage
{//colors for now, eventually will be the background images.
    if (_currentDialogueLevel%2 == 1){
         [self.view setBackgroundColor:[UIColor blueColor]];
    }
    else {
         [self.view setBackgroundColor:[UIColor redColor]];
    }
    
}

- (void) updateTextFields
{ //Switch which text field is visible, and add the info to both
    if (_currentDialogueLevel%2 == 1){
        self.hackerTextField.hidden = NO;
        self.bossTextField.hidden = YES;
    }
    else {
        self.hackerTextField.hidden = YES;
        self.bossTextField.hidden = NO;
    }
    self.bossTextField.text = [_model getStringForDialogue:_currentDialogueLevel];
    self.hackerTextField.text = [_model getStringForDialogue:_currentDialogueLevel];
    
}

- (IBAction)goToNextLevel // for reference, see similar method in levelSelectViewController
{
    int nextLevel = ++_currentLevel;
    [self presentViewController:[BGKVCutsceneViewController initialVCForLevel:nextLevel] animated:YES completion:nil];
    
}
  
+ (UIViewController *)initialVCForLevel:(NSInteger)level
{
    NSString *storyboardName;
    storyboardName = [NSString stringWithFormat:@"Level%ldStoryboard", (long)level];
        
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateInitialViewController];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //load the level and model.
    _currentLevel = 1; //TODO: Get the level from the storyboard
    _model = [[BGKVCutsceneModel alloc] initWithLevel: _currentLevel];
    
    // Initialize the background and text.
    [self changeBackgroundImage];
    [self updateTextFields];
    
    //Set the necessary attributes of the buttons and text.
    self.playLevelButton.hidden = YES;
    self.playLevelButton.userInteractionEnabled = NO;
    self.bossTextField.editable = NO;
    self.hackerTextField.editable = NO;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
