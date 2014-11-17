//
//  Level13Tests.m
//  SecurityGame
//
//  Created by CS121 on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel13PasswordViewController.h"

@interface Level13Tests : XCTestCase {
    BGKVLevel13PasswordViewController* controller;
}

@end

@implementation Level13Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel13PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"5"]);
    XCTAssertFalse([controller checkPassword:@"4"]);
    XCTAssertFalse([controller checkPassword:@"2"]);
    XCTAssertFalse([controller checkPassword:@"1"]);
    XCTAssertTrue([controller checkPassword:@"3"]);
}

@end
