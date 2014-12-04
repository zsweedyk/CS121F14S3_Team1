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

@implementation BGKVCutsceneViewController {

    BGKVCutsceneModel *_model;
    NSUInteger _currentLevel;
    NSUInteger _dialogueNumber;
    NSUInteger _currentDialogueLevel;
    NSArray* _textArray;
}

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
        
        self.hackerImage.hidden = NO;
        self.bossImage.hidden = YES;
    }
    else {
        
        self.hackerImage.hidden = YES;
        self.bossImage.hidden = NO;
    }
    
}

//from stackoverflow
- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGImageRef imageRef = image.CGImage;
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height);
    
    CGContextConcatCTM(context, flipVertical);
    CGContextDrawImage(context, newRect, imageRef);
    
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    UIGraphicsEndImageContext();
    
    return newImage;
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
    NSString *identifier;
    identifier = [NSString stringWithFormat: @"level%ld", (long)_currentLevel];
    [self performSegueWithIdentifier:identifier sender:self];
    
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
    _currentLevel = [self.levelProperty integerValue];
    _model = [[BGKVCutsceneModel alloc] initWithLevel:_currentLevel];
    _dialogueNumber = [_model getMaxDialogueLevel:_currentLevel];
    
    // Initialize the background and text.
    _currentDialogueLevel = 0;
    [self changeBackgroundImage];
    [self updateTextFields];
    _currentDialogueLevel++;  
    
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
