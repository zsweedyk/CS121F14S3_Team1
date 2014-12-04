//
//  BGKVCutsceneModel.m
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneModel.h"

@implementation BGKVCutsceneModel
{

NSArray* _levelDialogues;
NSUInteger _maxDialogueLevel;
}

- (id) initWithLevel:(NSUInteger)level
{
    self = [super init];
    if (self){
        switch (level) {
                //fill in the dialogues and how many elements there are here
            case 1:
                _levelDialogues = @[@"One of the employees left his computer unlocked.",
                                    @"Oh? Did you find anything interesting?",
                                    @"I didn't find anything suspicious on his computer, but I found that one of the leaked documents had recently been accessed by Erica. I'm going to check her computer next."];
                
                break;
            case -1: // Tutorial Level
                _levelDialogues = @[@"What are the details of my first assignment?",
                                    @"You're going to be investigating concerns about employees sharing privileged information",
                                    @"I understand."];
                break;
            case 2:
                _levelDialogues = @[@"Erica used her password as her hint, so it was really easy to access her computer.",
                                    @"What did you find on her computer?",
                                    @"I found some weird deposits to her bank account. They all had the note 'Erica, Stephen, Taylor.' I'm going to look into Stephen and Taylor next."];
                break;
            default:
                return nil;
                break;
        }
        
    }
    return self;
}

-(NSString*) getStringForDialogue:(NSUInteger)dialogue
{
    return _levelDialogues[dialogue];
}

-(NSUInteger)getMaxDialogueLevel:(NSUInteger)level
{
    return [_levelDialogues count];
}

@end
