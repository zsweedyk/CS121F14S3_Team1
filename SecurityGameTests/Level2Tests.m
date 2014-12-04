//
//  SecurityGameTests.m
//  SecurityGameTests
//
//  Created by Guest User on 10/20/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel2PasswordViewController.h"

@interface Level2Tests : XCTestCase {
    BGKVLevel2PasswordViewController* controller;
}

@end

@implementation Level2Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel2PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

/*
// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"dog"]);
    XCTAssertFalse([controller checkPassword:@"hog"]);
    XCTAssertTrue([controller checkPassword:@"frog"]);
}
*/
@end
