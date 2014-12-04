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
                _levelDialogues = @[@"1", @"2",@"3"];
                
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
