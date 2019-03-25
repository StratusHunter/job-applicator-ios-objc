//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "ViewModel.h"
#import "TeamType.h"
#import "NSString+Regex.h"
#import "JobApplication.h"

@implementation ViewModel {
}

- (NSArray<TeamType *> *)createTeamList:(NSString *)team {

    NSArray<NSString *> *teamList = [team componentsSeparatedByString:@","];
    NSMutableArray <TeamType *> *teamTypeArray = [NSMutableArray new];

    [teamList enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {

        NSString *noSpacesObj = [obj stringByReplacingOccurrencesOfString:@" " withString:@""];
        TeamType *teamType = [TeamType createWithString:noSpacesObj];

        if (teamType != nil) {

            [teamTypeArray addObject:[TeamType createWithString:noSpacesObj]];
        }
    }];

    return teamTypeArray;
}

- (NSArray<NSURL *> *)createURLList:(NSString *)url {

    NSArray<NSString *> *urlStringList = [url componentsSeparatedByString:@"\n"];
    NSMutableArray <NSURL *> *urlList = [NSMutableArray new];

    [urlStringList enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {

        NSURL *urlFromString = [[NSURL alloc] initWithString:obj];
        if (urlFromString != nil) {

            [urlList addObject:urlFromString];
        }
    }];

    return urlList;
}

- (BOOL)validateApplicationWithName:(nonnull NSString *)name email:(nonnull NSString *)email teams:(nonnull NSString *)teams about:(nonnull NSString *)about urls:(nonnull NSString *)urls {

    BOOL emailValid = email.length > 0 && [email isEmail];

    NSArray *teamList = [self createTeamList:teams];
    NSArray *urlList = [self createURLList:urls];

    return name.length > 0 && emailValid && teamList.count > 0 && about.length > 0 && urlList.count > 0;
}

- (JobApplication *)createApplicationWithName:(nonnull NSString *)name email:(nonnull NSString *)email teams:(nonnull NSString *)teams about:(nonnull NSString *)about urls:(nonnull NSString *)urls {

    NSMutableArray <NSString *> *teamList = [NSMutableArray new];
    [[self createTeamList:teams] enumerateObjectsUsingBlock:^(TeamType *obj, NSUInteger idx, BOOL *stop) {

        [teamList addObject:obj.string];
    }];

    NSMutableArray <NSString *> *urlList = [NSMutableArray new];
    [[self createURLList:urls] enumerateObjectsUsingBlock:^(NSURL *obj, NSUInteger idx, BOOL *stop) {

        [urlList addObject:obj.absoluteString];
    }];

    return [[JobApplication alloc] initWithName:name email:email about:about teams:teamList urls:urlList];
}
@end