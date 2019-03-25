//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "TeamType.h"

@implementation TeamType

+ (nullable TeamType *)createWithString:(NSString *)rawValue {

    NSUInteger index = [TeamType.stringValues indexOfObject:rawValue];
    return (index != NSNotFound) ? [[TeamType alloc] initWithTeam:index] : nil;
}

+ (NSArray<NSString *> *)stringValues {

    return @[@"android", @"ios", @"frontend", @"backend", @"design"];
}

- (instancetype)initWithTeam:(Team)team {

    self = [super init];

    if (self) {

        _team = team;
    }

    return self;
}

- (NSString *)string {

    switch (self.team) {

        case android:
            return TeamType.stringValues[android]; //Use this pattern to cause a compile time error when a new Team is added.
        case ios:
            return TeamType.stringValues[ios];
        case frontend:
            return TeamType.stringValues[frontend];
        case backend:
            return TeamType.stringValues[backend];
        case design:
            return TeamType.stringValues[design];
    }
}
@end