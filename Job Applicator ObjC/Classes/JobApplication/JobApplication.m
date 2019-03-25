//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "JobApplication.h"

static NSString const *nameKey = @"name";
static NSString const *emailKey = @"email";
static NSString const *aboutKey = @"about";
static NSString const *teamsKey = @"teams";
static NSString const *urlsKey = @"urls";

@implementation JobApplication

- (instancetype)initWithName:(NSString *)name email:(NSString *)email about:(NSString *)about teams:(NSArray <NSString *> *)teams urls:(NSArray <NSString *> *)urls {

    self = [super init];

    if (self) {

        self.name = name;
        self.email = email;
        self.about = about;
        self.teams = teams;
        self.urls = urls;
    }

    return self;
}

- (instancetype)initWithJSON:(NSDictionary *)json {

    NSString *name = json[nameKey] ?: @"";
    NSString *email = json[emailKey] ?: @"";
    NSString *about = json[aboutKey] ?: @"";
    NSArray *teams = json[teamsKey] ?: @[];
    NSArray *urls = json[urlsKey] ?: @[];

    return [self initWithName:name email:email about:about teams:teams urls:urls];
}

- (NSDictionary *)toJSON {

    return @{
            nameKey: self.name,
            nameKey: self.name,
            emailKey: self.email,
            aboutKey: self.about,
            teamsKey: self.teams,
            urlsKey: self.urls
    };
}

@end