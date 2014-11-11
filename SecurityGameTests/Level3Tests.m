//
//  SecurityGameTests.m
//  SecurityGameTests
//
//  Created by Sarah Gilkinson on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel3PasswordViewController.h"

@interface Level3Tests : XCTestCase {
    BGKVLevel3PasswordViewController* controller;
}

@end

@implementation Level3Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel3PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"taylor"]);
    XCTAssertFalse([controller checkPassword:@"TAYLOR"]);
    XCTAssertTrue([controller checkPassword:@"Taylor"]);
}

@end