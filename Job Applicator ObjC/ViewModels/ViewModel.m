//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "ViewModel.h"
#import "TeamType.h"
#import "NSString+Regex.h"
#import "JobApplication.h"
#import "RequestHandler.h"
#import "NSURL+Valid.h"

@interface ViewModel ()

@property(nonatomic, strong) RequestHandler *handler;
@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, strong) NSURLSessionDataTask *applyTask;

@end

@implementation ViewModel

- (instancetype)init {

    self = [self initWithSession:[NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration]];

    return self;
}

- (instancetype)initWithSession:(NSURLSession *)session {

    self = [super init];

    if (self) {

        self.handler = [RequestHandler new];
        self.session = session;
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

        NSString *escapedString = [obj stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
        NSURL *urlFromString = [[NSURL alloc] initWithString:escapedString];

        if ([urlFromString isValid]) {

            [urlList addObject:urlFromString];
        }
    }];

    return urlList;
}

- (BOOL)validateApplicationWithName:(NSString *)name email:(NSString *)email teams:(NSString *)teams about:(NSString *)about urls:(NSString *)urls {

    BOOL emailValid = email.length > 0 && [email isEmail];

    NSArray *teamList = [self createTeamList:teams];
    NSArray *urlList = [self createURLList:urls];

    return name.length > 0 && emailValid && teamList.count > 0 && about.length > 0 && urlList.count > 0;
}

- (JobApplication *)createApplicationWithName:(NSString *)name email:(NSString *)email teams:(NSString *)teams about:(NSString *)about urls:(NSString *)urls {

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

- (void)performApplyRequest:(JobApplication *)application completionHandler:(void (^)(JobApplication *__nullable, NSError *__nullable))completionHandler {

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