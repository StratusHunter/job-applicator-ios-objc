//
// Created by Terence Baker on 2019-03-25.
//

#import "JobApplication.h"

typedef NSString *JobApplicationJSONKey NS_TYPED_ENUM;
static JobApplicationJSONKey const NameKey = @"name";
static JobApplicationJSONKey const EmailKey = @"email";
static JobApplicationJSONKey const AboutKey = @"about";
static JobApplicationJSONKey const TeamsKey = @"teams";
static JobApplicationJSONKey const UrlsKey = @"urls";

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

    NSString *name = json[NameKey] ?: @"";
    NSString *email = json[EmailKey] ?: @"";
    NSString *about = json[AboutKey] ?: @"";
    NSArray *teams = json[TeamsKey] ?: @[];
    NSArray *urls = json[UrlsKey] ?: @[];

    return [self initWithName:name email:email about:about teams:teams urls:urls];
}

- (NSDictionary *)toJSON {

    return @{
            NameKey: self.name,
            EmailKey: self.email,
            AboutKey: self.about,
            TeamsKey: self.teams,
            UrlsKey: self.urls
    };
}

@end