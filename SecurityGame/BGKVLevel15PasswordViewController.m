//
//  BGKVLevel15PasswordViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/17/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//


#import "BGKVLevel15PasswordViewController.h"

@implementation BGKVLevel15PasswordViewController {
    NSUInteger _currentEmailLevel;
    NSArray* _correctAnswers;
}

- (IBAction)trackSelections:(UIButton *)sender
{
    // Check if the tag of "Send" or "Don't send" matches the expected answer
    if ([[_correctAnswers objectAtIndex:_currentEmailLevel] integerValue] == sender.tag) {
        _currentEmailLevel += 1;
        if (_currentEmailLevel == _correctAnswers.count) {
            self.continueButton.hidden = NO;
            
            self.sendButton.hidden = YES;
            self.dontSendButton.hidden = YES;
            
            self.informationField.selectable = YES;
            self.informationField.text = @"Good work! Continue on!";
            self.informationField.selectable = NO;
        }
        [self updateInformationField];
    } else {
        self.sendButton.hidden = YES;
        self.dontSendButton.hidden = YES;
        [self displayWrongAnswerInformation:_currentEmailLevel];
        self.tryAgainButton.hidden = NO;
    }
}

// Updates text field to contain question
- (void)updateInformationField
{
    // http://stackoverflow.com/questions/19049917/uitextview-font-is-being-reset-after-settext
    // For some silly reason, changing the content of a textfield always changes the font size and color
    // Making it selectable fixes it. We then disable selectable after the update.
    self.informationField.selectable = YES;
    switch (_currentEmailLevel) {
        case 0:
            self.informationField.text = @"Hello there, I see you just got this email! Please click \"Send Info\" to start up this service.";
            break;
        case 1:
            self.informationField.text = @"Hello there, I don't know you or your friends and would like to friend them all! Can you send me all of their email addresses?";
            break;
        case 2:
            self.informationField.text = @"Hello there, I would like to send you A LOT of money but I don't have your address? Can you send me your address and phone number?";
            break;
        case 3:
            self.informationField.text = @"Hello there, I am your teacher and you forgot to send me your homework! Can you send me your homework?";
            break;
        case 4:
            self.informationField.text = @"Hello there, you seem to be having computer troubles lately. I can help with that. Can you send me your password?";
            break;
            
    }
    self.informationField.selectable = NO;
}

// Reset email level and update fields
- (IBAction)tryAgain:(id)sender
{
    _currentEmailLevel = 0;
    [self updateInformationField];
    self.tryAgainButton.hidden = YES;
    self.sendButton.hidden = NO;
    self.dontSendButton.hidden = NO;
}

- (void)displayWrongAnswerInformation:(NSUInteger)i
{
    self.informationField.selectable = YES;
    if (i == 0) {
        self.informationField.text = @"Make sure you follow the instructions!";
    } else if (i == 1) {
        self.informationField.text = @"You don't want to give out emails to strangers! Try again!";
    } else if (i == 2) {
        self.informationField.text = @"You shouldn't give out personal information like addresses and phone numbers to unknown people online! Try again!";
    } else if (i == 3) {
        self.informationField.text = @"Turn in your homework on time, and if your teacher asks for it, turn it in! Try again!";
    } else if (i == 4) {
        self.informationField.text = @"Never, ever, ever give out your password, to anyone! No email should ever ask you for your password. Try again!";
    }
    self.informationField.selectable = NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
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
    _currentEmailLevel = 0;
    
    // Boolean array containing whether the user should tap "Send" or "Don't send"
    _correctAnswers = @[@0,@1,@1,@0,@1];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
