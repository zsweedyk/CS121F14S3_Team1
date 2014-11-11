//
//  SecurityGameTests.m
//  SecurityGameTests
//
//  Created by Sarah Gilkinson on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel6PasswordViewController.h"

@interface Level6Tests : XCTestCase {
    BGKVLevel6PasswordViewController* controller;
}

@end

@implementation Level6Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel6PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"password"]);
    XCTAssertFalse([controller checkPassword:@"password1"]);
    XCTAssertTrue([controller checkPassword:@"password1!"]);
}

@end