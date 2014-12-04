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
    NSUInteger _maxDialogueLevel;
}

+ (NSArray *)dialogueForLevel:(NSInteger)level
{
    switch (level) {
            //fill in the dialogues
        case 1:
            return @[@"1", @"2",@"3"];
            break;
            
        case 0:
        default:
            return nil;
            break;
    }
}

@end
