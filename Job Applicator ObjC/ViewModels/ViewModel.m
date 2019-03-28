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

- (nonnull NSArray<Team> *)createTeamList:(nonnull NSString *)team {

    NSArray<NSString *> *teamList = (team.length > 0) ? [team componentsSeparatedByString:@","] : @[];
    NSMutableArray <Team> *teamArray = [NSMutableArray new];

    for (NSString *teamString in teamList) {

        NSString *noSpacesString = [teamString stringByReplacingOccurrencesOfString:@" " withString:@""];
        Team team = [TeamType teamWithString:noSpacesString];

        if (team != nil) {

            [teamArray addObject:team];
        }
    }
    
    return teamArray;
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

    NSMutableArray <NSString *> *urlList = [NSMutableArray new];
    for (NSURL *url in [self createURLList:urls]) {

        [urlList addObject:url.absoluteString];
    }

    return [[JobApplication alloc] initWithName:name email:email about:about teams:[self createTeamList:teams] urls:urlList];
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
