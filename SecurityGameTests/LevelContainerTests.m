//
//  LevelContainerTests.m
//  SecurityGame
//
//  Created by Guest User on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BGKVLevelContainer.h"

@interface LevelContainerTests : XCTestCase {
    BGKVLevelContainer *container;
}

@end

@implementation LevelContainerTests

- (void)setUp
{
    [super setUp];
    container = [[BGKVLevelContainer alloc] init];
    
    // Has to be try-caught because LevelContainer expects to have an 'initial' segue
    @try {
        container.view; //forces view to be loaded
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInvalidArgumentException])
        {
            // do nothing, everything's gonna be ok.
        }
        else
        {
            @throw;
        }
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialValues
{
    XCTAssertTrue(container.levelContainer == container);
    XCTAssertNil(container.currentLevelVC);
    XCTAssertNotNil(container.levelView);
    XCTAssertNotNil(container.menuButton);
    XCTAssertNotNil(container.backButton);
    XCTAssertNotNil(container.hintButton);
}

@end
