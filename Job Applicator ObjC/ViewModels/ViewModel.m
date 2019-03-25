//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "ViewModel.h"
#import "TeamType.h"
#import "NSString+Regex.h"
#import "JobApplication.h"
#import "RequestHandler.h"

@interface ViewModel ()

@property(nonatomic, strong) RequestHandler *handler;
@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, strong) NSURLSessionDataTask *applyTask;

@end

@implementation ViewModel

- (instancetype)init {

    self = [super init];

    if (self) {

        self.handler = [RequestHandler new];
        self.session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }

    return self;
}

- (nonnull NSArray<TeamType *> *)createTeamList:(nonnull NSString *)team {

    NSArray<NSString *> *teamList = (team.length > 0) ? [team componentsSeparatedByString:@","] : @[];
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

- (nonnull NSArray<NSURL *> *)createURLList:(nonnull NSString *)url {

    NSArray<NSString *> *urlStringList = (url.length > 0) ? [url componentsSeparatedByString:@"\n"] : @[];
    NSMutableArray <NSURL *> *urlList = [NSMutableArray new];

    [urlStringList enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {

        NSString *escapedString = [obj stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *urlFromString = [[NSURL alloc] initWithString:escapedString];

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

- (nonnull JobApplication *)createApplicationWithName:(nonnull NSString *)name email:(nonnull NSString *)email teams:(nonnull NSString *)teams about:(nonnull NSString *)about urls:(nonnull NSString *)urls {

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

- (void)performApplyRequest:(nonnull JobApplication *)application completionHandler:(void (^)(JobApplication *, NSError *))completionHandler {

    [self.applyTask cancel];

    self.applyTask = [self.session dataTaskWithRequest:[self.handler applyRequest:application]
                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

                                         JobApplication *responseApplication = nil;

                                         if (error == nil) {

                                             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                             responseApplication = [[JobApplication alloc] initWithJSON:json];
                                         }

                                         if (completionHandler) {

                                             dispatch_async(dispatch_get_main_queue(), ^{

                                                 completionHandler(responseApplication, error);
                                             });
                                         }
                                     }];

    [self.applyTask resume];
}
@end