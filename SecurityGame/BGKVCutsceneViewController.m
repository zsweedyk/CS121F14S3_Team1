//
//  BGKVCutsceneViewController.m
//  SecurityGame
//
//  Created by Josh Kutsko on 12/1/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneViewController.h"

@interface BGKVCutsceneViewController ()

@end

@implementation BGKVCutsceneViewController

int _dialogueNumber;
int _currentDialogueLevel;
int* _textArray[];

- (IBAction)continueButton:(id)sender
{
    [self changeBackgroundImage];
    [self updateTextFields];
}

- (void) changeBackgroundImage
{
    [self.view setBackgroundColor:[UIColor blueColor]];
    
}

- (void) updateTextFields
{
    self.bossTextField.text = @"test";
    self.hackerTextField.text = @"test2";
    
}

- (IBAction)goToNextLevel
{
    
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
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
