//
//  ViewModelTests.m
//  Job Applicator ObjCTests
//
//  Created by Terence Baker on 25/03/2019.
//  Copyright © 2019 Bulb Studios Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewModel.h"
#import "TeamType.h"
#import "JobApplication.h"

@interface ViewModelTests : XCTestCase

@property(nonatomic, strong, nonnull) ViewModel *viewModel;
@property(nonatomic, strong, nonnull) NSString *aName;
@property(nonatomic, strong, nonnull) NSString *email;
@property(nonatomic, strong, nonnull) NSString *team;
@property(nonatomic, strong, nonnull) NSString *about;
@property(nonatomic, strong, nonnull) NSString *url;

@end

@implementation ViewModelTests

- (void)setUp {

    self.viewModel = [ViewModel new];
    self.aName = @"A Name";
    self.email = @"test@test.com";
    self.team = [[[TeamType alloc] initWithTeam:android] string];
    self.about = @"About text";
    self.url = @"https://test.com";
}

- (void)tearDown {
}

- (void)test_validateApplication_withValidData_assertTrue {

    BOOL validData = [self.viewModel validateApplicationWithName:self.aName
                                                           email:self.email
                                                           teams:self.team
                                                           about:self.about
                                                            urls:self.url];

    XCTAssertTrue(validData, @"Valid data no longer considered valid");
}

- (void)test_validateApplication_withMissingData_assertFalse {

    BOOL nameMissing = [self.viewModel validateApplicationWithName:@""
                                                             email:self.email
                                                             teams:self.team
                                                             about:self.about
                                                              urls:self.url];

    BOOL emailMissing = [self.viewModel validateApplicationWithName:self.aName
                                                              email:@""
                                                              teams:self.team
                                                              about:self.about
                                                               urls:self.url];

    BOOL teamMissing = [self.viewModel validateApplicationWithName:self.aName
                                                             email:self.email
                                                             teams:@""
                                                             about:self.about
                                                              urls:self.url];

    BOOL aboutMissing = [self.viewModel validateApplicationWithName:self.aName
                                                              email:self.email
                                                              teams:self.team
                                                              about:@""
                                                               urls:self.url];

    BOOL urlMissing = [self.viewModel validateApplicationWithName:self.aName
                                                            email:self.email
                                                            teams:self.team
                                                            about:self.about
                                                             urls:@""];

    XCTAssertFalse(nameMissing, "Name should not be empty");
    XCTAssertFalse(emailMissing, "Email should not be empty");
    XCTAssertFalse(teamMissing, "Team should not be empty");
    XCTAssertFalse(aboutMissing, "About should not be empty");
    XCTAssertFalse(urlMissing, "URLs should not be empty");
}

- (void)test_validationApplication_withIncorrectData_assertFalse {

    BOOL emailInvalid = [self.viewModel validateApplicationWithName:self.aName
                                                              email:@"Not an email"
                                                              teams:self.team
                                                              about:self.about
                                                               urls:self.url];

    BOOL teamInvalid = [self.viewModel validateApplicationWithName:self.aName
                                                             email:self.email
                                                             teams:@"Not a team"
                                                             about:self.about
                                                              urls:self.url];

    BOOL urlInvalid = [self.viewModel validateApplicationWithName:self.aName
                                                            email:self.email
                                                            teams:self.team
                                                            about:self.about
                                                             urls:@"Not a url"];

    XCTAssertFalse(emailInvalid, "Email validation failing");
    XCTAssertFalse(teamInvalid, "Team validation failing");
    XCTAssertFalse(urlInvalid, "URL validation failing");
}

- (void)test_createApplication_validatePropertyMapping_assertEqual {

    JobApplication *application = [self.viewModel createApplicationWithName:self.aName
                                                                      email:self.email
                                                                      teams:self.team
                                                                      about:self.about
                                                                       urls:self.url];

    XCTAssertEqualObjects(application.name, self.aName, @"Name property not mapped correctly");
    XCTAssertEqualObjects(application.email, self.email, @"Email property not mapped correctly");
    XCTAssertEqualObjects(application.about, self.about, @"About property not mapped correctly");
    XCTAssertEqualObjects(application.teams.firstObject, self.team, @"Team property not mapped correctly");
    XCTAssertEqualObjects(application.urls.firstObject, self.url, @"URL property not mapped correctly");
}

- (void)test_createApplication_validateArrayPopulation_assertEqual {

    NSString *teamString = [NSString stringWithFormat:@"%@, %@", self.team, [[[TeamType alloc] initWithTeam:ios] string]];
    NSString *urlString = [NSString stringWithFormat:@"%@\n%@", self.url, self.url];

    JobApplication *application = [self.viewModel createApplicationWithName:self.aName
                                                                      email:self.email
                                                                      teams:teamString
                                                                      about:self.about
                                                                       urls:urlString];

    XCTAssertEqual(application.teams.count, 2, "Unexpected team array size");
    XCTAssertEqual(application.urls.count, 2, "Unexpected URL array size");
}

@end
