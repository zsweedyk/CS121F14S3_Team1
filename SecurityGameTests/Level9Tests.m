//
//  Level9Tests.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/15/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BGKVLevel9PasswordViewController.h"

@interface Level9Tests : XCTestCase {
    BGKVLevel9PasswordViewController* controller;
}

@end

@implementation Level9Tests

- (void)setUp
{
    [super setUp];
    controller = [BGKVLevel9PasswordViewController alloc];
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
    XCTAssertTrue([controller checkPassword:@"gbnDfbN52"]);
}

@end