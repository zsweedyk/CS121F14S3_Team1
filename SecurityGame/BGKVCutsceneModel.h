//
//  BGKVCutsceneModel.h
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVCutsceneModel : NSObject

- (id) initWithLevel: (int) level;

- (int) getMaxDialogueLevel: (int) level;

- (NSString*)getStringForDialogue: (int) dialogue;

@end

