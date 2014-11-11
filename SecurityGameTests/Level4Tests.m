//
//  Level4Tests.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BGKVLevel4PasswordViewController.h"

@interface Level4Tests : XCTestCase {
    BGKVLevel4PasswordViewController* controller;
}

@end

@implementation Level4Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel4PasswordViewController alloc];
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
    XCTAssertFalse([controller checkPassword:@"1245"]);
    XCTAssertFalse([controller checkPassword:@"12345"]);
    XCTAssertTrue([controller checkPassword:@"1234"]);
}

@end
