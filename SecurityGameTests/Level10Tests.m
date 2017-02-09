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
}

- (void)tearDown
{
    [super tearDown];
}

// Tests checkComputerPassword method for correct password
- (void)testCheckComputerPassword
{
    controller = [[UIStoryboard storyboardWithName:@"Level10Storyboard" bundle:nil]
                  instantiateViewControllerWithIdentifier:@"ComputerPasswordController"];
    XCTAssertFalse([controller checkPassword:@"taylor"]);
    XCTAssertFalse([controller checkPassword:@"dog"]);
    XCTAssertFalse([controller checkPassword:@"1245"]);
    XCTAssertFalse([controller checkPassword:@"12345"]);
    XCTAssertFalse([controller checkPassword:@"CgF3n8x6"]);
    XCTAssertFalse([controller checkPassword:@"8443"]);
    XCTAssertTrue([controller checkPassword:@"alphabet"]);
}

// Tests checkPassword method for correct password
- (void)testCheckPhonePassword
{
    controller = [[UIStoryboard storyboardWithName:@"Level10Storyboard" bundle:nil]
                  instantiateViewControllerWithIdentifier:@"PhonePasswordController"];
    XCTAssertFalse([controller checkPassword:@"taylor"]);
    XCTAssertFalse([controller checkPassword:@"dog"]);
    XCTAssertFalse([controller checkPassword:@"1245"]);
    XCTAssertFalse([controller checkPassword:@"12345"]);
    XCTAssertFalse([controller checkPassword:@"CgF3n8x6"]);
    XCTAssertFalse([controller checkPassword:@"alphabet"]);
    XCTAssertTrue([controller checkPassword:@"8443"]);
}

@end
