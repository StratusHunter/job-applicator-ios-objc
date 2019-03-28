//
//  TeamTypeTest.m
//  Job Applicator ObjC
//
//  Created by Terence Baker on 2019-03-28.
//  Copyright © 2019 Bulb Studios Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TeamType.h"

@interface TeamTypeTest : XCTestCase

@end

@implementation TeamTypeTest

- (void)test_teamWithString_withValidData_assertTrue {

    for (Team team in [TeamType allTeams]) {

        XCTAssertEqualObjects([TeamType teamWithString:team], team);
    }
}

- (void)test_teamWithString_withInvalidData_assertTrue {

    XCTAssertEqualObjects([TeamType teamWithString:@"Not a team"], nil);
}

@end
