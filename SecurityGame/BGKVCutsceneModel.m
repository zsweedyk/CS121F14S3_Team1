//
//  BGKVCutsceneModel.m
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCutsceneModel.h"

@implementation BGKVCutsceneModel

NSArray* _levelDialogues;
int _maxDialogueLevel;

- (id) initWithLevel:(int)level
{
    self = [super init];
    if (self){
        switch (level) {
                //fill in the dialogues and how many elements there are here
            case 1:
                _levelDialogues = @[@"1", @"2",@"3"];
                _maxDialogueLevel = 3;
                break;
                
            default:
                break;
        }
        
    }
    return self;
}

-(NSString*) getStringForDialogue:(int)dialogue
{
    return _levelDialogues[dialogue];
}

-(int)getMaxDialogueLevel:(int)level
{
    return _maxDialogueLevel;
}

@end
