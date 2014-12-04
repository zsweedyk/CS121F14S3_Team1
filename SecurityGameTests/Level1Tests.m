//
//  SecurityGameTests.m
//  SecurityGameTests
//
//  Created by Guest User on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel1PasswordViewController.h"

@interface Level1Tests : XCTestCase {
    BGKVLevel1PasswordViewController* controller;
}

@end

@implementation Level1Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel1PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
/*
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"password"]);
    XCTAssertFalse([controller checkPassword:@""]);
    XCTAssertFalse([controller checkPassword:@"frog"]);
    XCTAssertFalse([controller checkPassword:@"1234"]);
    XCTAssertTrue([controller checkPassword:@"Password"]);
}
*/
@end
