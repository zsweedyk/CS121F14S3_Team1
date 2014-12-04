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
            
        // 0 is the default value for "level". Thus, 0 corresponds to being unset,
        // and not to the tutorial level which is otherwise considered Level 0.
        // For that reason, here we consider the tutorial level to be Level -1.
        case 0:
        default:
            return nil;
            break;
    }
}

@end
