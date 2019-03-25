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

@implementation JobApplication {
}

- (instancetype)initWithName:(NSString *)name email:(NSString *)email about:(NSString *)about teams:(NSArray <NSString *> *)teams urls:(NSArray <NSString *> *)urls {

    self = [super init];

    if (self) {

        _name = name;
        _email = email;
        _about = about;
        _teams = teams;
        _urls = urls;
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    NSString *name = [aDecoder decodeObjectForKey:nameKey] ?: @"";
    NSString *email = [aDecoder decodeObjectForKey:emailKey] ?: @"";
    NSString *about = [aDecoder decodeObjectForKey:aboutKey] ?: @"";
    NSArray *teams = [aDecoder decodeObjectForKey:teamsKey] ?: @[];
    NSArray *urls = [aDecoder decodeObjectForKey:urlsKey] ?: @[];

    return [[JobApplication alloc] initWithName:name email:email about:about teams:teams urls:urls];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:self.name forKey:nameKey];
    [aCoder encodeObject:self.email forKey:emailKey];
    [aCoder encodeObject:self.about forKey:aboutKey];
    [aCoder encodeObject:self.teams forKey:teamsKey];
    [aCoder encodeObject:self.urls forKey:urlsKey];
}
@end