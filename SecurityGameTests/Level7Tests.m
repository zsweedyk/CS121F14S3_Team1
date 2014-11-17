//
//  Level7Tests.m
//  SecurityGame
//
//  Created by CS121 on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel7PasswordViewController.h"

@interface Level7Tests : XCTestCase {
    BGKVLevel7PasswordViewController* controller;
}

@end

@implementation Level7Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel7PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"password"]);
    XCTAssertFalse([controller checkPassword:@"Password"]);
    XCTAssertFalse([controller checkPassword:@"pAsSwOrD"]);
    XCTAssertTrue([controller checkPassword:@"PaSsWoRd"]);
}

@end