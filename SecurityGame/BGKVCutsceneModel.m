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

- (instancetype)initForLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        switch (level) {
            //fill in the dialogues
            case 1:
                _levelDialogues = @[@"1", @"2",@"3"];
                break;
                
            // 0 is the default value for "level". Thus, 0 corresponds to being unset,
            // and not to the tutorial level which is otherwise considered Level 0.
            // For that reason, here we consider the tutorial level to be Level -1.
            // If the level is not set, then the model is nil.
            case 0:
            default:
                return nil;
                break;
        }
    }
    return self;
}

- (NSUInteger)count
{
    return [_levelDialogues count];
}

- (NSString *)dialogueAtIndex:(NSUInteger)dialogueIndex
{
    return _levelDialogues[dialogueIndex];
}

@end
