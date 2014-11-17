//
//  Level5Tests.m
//  SecurityGame
//
//  Created by Guest User on 11/16/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGKVLevel5PasswordViewController.h"

@interface Level5Tests : XCTestCase {
    BGKVLevel5PasswordViewController* controller;
}

@end

@implementation Level5Tests

- (void)setUp
{
    [super setUp];
    controller = [[BGKVLevel5PasswordViewController alloc] init];
}

- (void)enterNumber:(int)number
{
    UIButton *dummyButton = [[UIButton alloc] init];
    dummyButton.tag = number;
    [controller pushIPhoneButton:dummyButton];
}
- (void)enterNumbers:(NSArray *)numbers
{
    for (NSNumber *n in numbers) {
        [self enterNumber:[n intValue]];
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSArray *x;
    x = @[@1, @2];
    XCTAssertFalse([controller checkPassword: x]);
    XCTAssertFalse([controller checkPassword:@[]]);
    XCTAssertFalse([controller checkPassword:nil]);
    
    x = @[@1, @2, @3, @4];
    XCTAssertFalse([controller checkPassword:x]);
    
    x = @[@1, @1, @2, @1];
    XCTAssertTrue([controller checkPassword:x]);
}

@end
