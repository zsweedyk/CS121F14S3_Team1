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
    // FIX ME: Why is this complaining?
    if ([_correctAnswers objectAtIndex:_currentEmailLevel] == sender.tag) {
        _currentEmailLevel += 1;
        if (_currentEmailLevel == _correctAnswers.count) {
            self.continueButton.hidden = NO;
            
            self.sendButton.hidden = YES;
            self.dontSendButton.hidden = YES;
            self.informationField.text = @"Good work! Continue on!";
        }
        [self updateInformationField];
    } else {
        [self displayWrongAnswerInformation:sender.tag];
        self.tryAgainButton.hidden = NO;
    }
}

- (void)updateInformationField
{
    switch (_currentEmailLevel) {
        case 0:
            self.informationField.text = @"Hello there, I see you just got this email! Please click \"Send Info\" to start up this service.";
            break;
        case 1:
            self.informationField.text = @"Hello there, I don't know you and want to be your friend through email! Can you send me a good email to reach you at?";
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
}

- (IBAction)tryAgain:(id)sender
{
    _currentEmailLevel = 0;
    [self updateInformationField];
    self.tryAgainButton.hidden = YES;
}

- (void)displayWrongAnswerInformation:(NSUInteger)i
{
    if (i == 0) {
        self.informationField.text = @"This was actually a bad thing to send! You don't want to disclose that kind of information! Try again!";
    } else {
        self.informationField.text = @"This was actually fine to send! You're not giving away any secret information! Try again!";
    }
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
