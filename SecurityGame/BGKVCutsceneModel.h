//
//  BGKVCutsceneModel.h
//  SecurityGame
//
//  Created by CS121 on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGKVCutsceneModel : NSObject

- (NSUInteger)count;
- (instancetype)initForLevel:(NSInteger)level;
- (NSString *)dialogueAtIndex:(NSUInteger)dialogueIndex;

@end

