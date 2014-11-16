//
//  Level10Tests.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BGKVLevel10PasswordViewController.h"

@interface Level10Tests : XCTestCase {
    BGKVLevel10PasswordViewController* controller;
}

@end

@implementation Level10Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel10PasswordViewController alloc];
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkComputerPassword method for correct password
- (void)testCheckComputerPassword
{
    XCTAssertFalse([controller checkComputerPassword:@"taylor"]);
    XCTAssertFalse([controller checkComputerPassword:@"frog"]);
    XCTAssertFalse([controller checkComputerPassword:@"1245"]);
    XCTAssertFalse([controller checkComputerPassword:@"12345"]);
    XCTAssertFalse([controller checkComputerPassword:@"CgF3n8x6"]);
    XCTAssertFalse([controller checkComputerPassword:@"8443"]);
    XCTAssertTrue([controller checkComputerPassword:@"alphabet"]);
}

// Tests checkPassword method for correct password
- (void)testCheckPhonePassword
{
    XCTAssertFalse([controller checkPhonePassword:@"taylor"]);
    XCTAssertFalse([controller checkPhonePassword:@"frog"]);
    XCTAssertFalse([controller checkPhonePassword:@"1245"]);
    XCTAssertFalse([controller checkPhonePassword:@"12345"]);
    XCTAssertFalse([controller checkPhonePassword:@"CgF3n8x6"]);
    XCTAssertFalse([controller checkPhonePassword:@"alphabet"]);
    XCTAssertTrue([controller checkPhonePassword:@"8443"]);
}

@end
