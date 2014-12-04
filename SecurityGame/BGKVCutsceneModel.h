//
//  BGKVCutsceneModel.h
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVCutsceneModel : NSObject

- (id) initWithLevel: (NSUInteger) level;

- (NSUInteger) getMaxDialogueLevel: (NSUInteger) level;

- (NSString*)getStringForDialogue: (NSUInteger) dialogue;

@end

