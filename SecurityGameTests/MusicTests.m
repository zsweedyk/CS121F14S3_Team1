//
//  MusicTests.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/3/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BGKVMusicPlayer.h"


@interface MusicTests : XCTestCase {
    BGKVMusicPlayer* player;
}

@end

@implementation MusicTests

- (void)setUp
{
    [super setUp];
    player = [BGKVMusicPlayer sharedInstance];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests the Singleton behavior
- (void)testSharedInstance
{
    XCTAssertNotNil(player);
    
    BGKVMusicPlayer* newPlayer = [BGKVMusicPlayer sharedInstance];
    XCTAssertTrue(player == newPlayer);
}

@end
