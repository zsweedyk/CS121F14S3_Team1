//
//  BGKVCutsceneModel.m
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneModel.h"

@implementation BGKVCutsceneModel {
    NSArray* _levelDialogues;
}

- (instancetype)initForLastLevel
{
    return [self initForLevel:20];
}


/*
 This method stores all of the data for cutscenes. 
 Each level's dialogue is initialized in this switch.
 To add a new level with new dialogue, add another case here.
 */
- (instancetype)initForLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        switch (level) {
            //fill in the dialogues
            case 0: // Tutorial Level
                _levelDialogues = @[@"What are the details of my first assignment?",
                                    @"You're going to be investigating concerns about employees sharing privileged information",
                                    @"I understand."];
                break;
            case 1:
                _levelDialogues = @[@"One of the employees left his computer unlocked.",
                                    @"Oh? Did you find anything interesting?",
                                    @"I didn't find anything suspicious on his computer, but I found that one of the leaked documents had recently been accessed by Erika. I'm going to check her computer next."];
                break;
            case 2:
                _levelDialogues = @[@"Erika used her password as her hint, so it was really easy to access her computer.",
                                    @"What did you find on her computer?",
                                    @"I found some weird deposits to her bank account. They all had the note 'Erika, Stephen, Taylor.' I'm going to look into Stephen and Taylor next."];
                break;
            case 3:
                _levelDialogues = @[@"Stephen's password was a bit harder, but I found a note in his office with a helpful hint.",
                                    @"What did you find on his computer?",
                                    @"Stephen had some of the leaked files up on his computer, as well as an email to Emily with some secret information.",
                                    @"Well, look into Taylor's computer, then check Emily."];
                break;
            case 4:
                _levelDialogues = @[@"Taylor's password was pretty easy. She just used her name.",
                                    @"What was on Taylor's computer?",
                                    @"Not much on this computer, but she left her phone here. I'm going to check that next"];
                break;
            case 5:
                _levelDialogues = @[@"Taylor's password was a simple sequence of numbers. No problem getting in.",
                                    @"Did you find anything interesting?",
                                    @"She had a lot of calls to Emily. I'll check her phone next."];
                break;
            case 6:
                _levelDialogues = @[@"Emily's phone password was just her birthday.",
                                    @"That's pretty easy to guess. What did you find?",
                                    @"She was calling Taylor and the CEO at Novam Vitam a lot. I definitely want to check her computer."];
                break;
            case 7:
                _levelDialogues = @[@"Emily just added a number and exclamation point to her password.",
                                    @"That's pretty common. Was there anything on her computer?",
                                    @"Not much on this computer, but she's logged into a computer in another office. I'll go check that next."];
                break;
            case 8:
                _levelDialogues = @[@"I think Emily likes amusement parks!",
                                    @"What?",
                                    @"Never mind. She had sent some emails with important files to Carl and Rebecca. I'm going to check them next."];
                break;
            case 9:
                _levelDialogues = @[@"Carl had a pretty simple password. He just substituted numbers for letters.",
                                    @"Is there anything on his computer?",
                                    @"Nothing out of the ordinary. Carl was preparing a report and needed those documents for information.",
                                    @"That's good.",
                                    @"I'll check Rebecca's computer next."];
                break;
            case 10:
                _levelDialogues = @[@"Rebecca had a better password, but she left an unencrypted USB drive with her password on it.",
                                    @"What did her computer have?",
                                    @"I'm not sure if it was important, but she has been emailing Emily a lot about the new secret project. There's another computer in the office though. I'm going to check it next."];
                break;
            case 11:
                _levelDialogues = @[@"The USB drive had her phone password on it as well. She had her password saved on her phone outside of a password manager.",
                                    @"Did you find anything interesting?",
                                    @"She had a list of people saved on her computer. Most of them seem to be involved.",
                                    @"Great! Please send over your preliminary findings."];
                break;
            case 12:
                _levelDialogues = @[@"Uh oh! I'm submitted the report over HTTP!",
                                    @"Be more careful next time! I set something up on your computer to make it easier. Try again."];
                break;
            case 13:
                _levelDialogues = @[@"I sent it over HTTPS now.",
                                    @"Good! You mentioned some weird deposits to Erika's account. Could you search for the policy on offshore bank accounts?"];
                break;
            case 14:
                _levelDialogues = @[@"I had to sift through a lot of spam. Good thing I remembered that people don't really want to give me free money!",
                                    @"Make sure to add your findings to your report. Check Stephen's computer next."];
                break;
            case 15:
                _levelDialogues = @[@"He had a lot of spam emails, but I found the right one to reset his login information.",
                                    @"Anything else about Stephen?",
                                    @"With all of this spam, I'm worried that someone gained access to his computer and sent the files to Emily. Stephen looks clean. I need to respond to some emails on my own computer."];
                break;
            case 16:
                _levelDialogues = @[@"More spam. Maybe someone's trying to get us off their trail.",
                                    @"Okay. I need you to download some software to everyone's computers to monitor their actions. Start with Stephen's computer."];
                break;
            case 17:
                _levelDialogues = @[@"I got it downloaded and installed on all the computers. It was difficult to find the right installer with all of the spam.",
                                    @"Good work! All of the people we're investigating work under the same manager. Check his computer next."];
                break;
            case 18:
                _levelDialogues = @[@"The manager's password was pretty hard. He had a note with some of his passwords for other sites, so I used the password guesser to match the pattern.",
                                    @"Anything interesting?",
                                    @"This looks like it goes deep. I'm going to go check the chief technology officer's computer."];
                break;
            case 19:
                _levelDialogues = @[@"The CTO had a pretty complex password system. He had capital letters, lowercase letters, numbers, and symbols, but he left too many hints sitting arround.",
                                    @"What did you find?",
                                    @"Nothing yet. Let's install monitoring software on his computer"];
                break;
            case 20:
                _levelDialogues = @[@"How did that Vita Brevis case turn out?",
                                    @"Good job catching that crooked CTO! It looks like he was recruiting people at Vita Brevis to move over with him to Novam Vitam. Everyone who was involved has been arrested! You got a big bonus from Vita Brevis for your great work!"];
                break;
            default:
                return nil;
                break;
        }
    }
    return self;
}

//Getter functions for the cutscene controller to access.

- (NSUInteger)count
{
    return [_levelDialogues count];
}

- (NSString *)dialogueAtIndex:(NSUInteger)dialogueIndex
{
    return _levelDialogues[dialogueIndex];
}

@end
