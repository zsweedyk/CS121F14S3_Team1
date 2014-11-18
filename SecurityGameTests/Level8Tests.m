//
//  Level8Tests.m
//  SecurityGame
//
//  Created by Josh Kutsko on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BGKVLevel8PasswordViewController.h"

@interface Level8Tests : XCTestCase {
    BGKVLevel8PasswordViewController* controller;
}

@end

@implementation Level8Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel8PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkPassword method for correct password
- (void)testCheckPassword
{
    XCTAssertFalse([controller checkPassword:@"taylor"]);
    XCTAssertFalse([controller checkPassword:@"frog"]);
    XCTAssertFalse([controller checkPassword:@"password"]);
    XCTAssertFalse([controller checkPassword:@"winner"]);
    XCTAssertTrue([controller checkPassword:@"w1nn3r"]);
}

@end
