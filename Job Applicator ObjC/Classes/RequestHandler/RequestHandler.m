//
// Created by Terence Baker on 2019-03-25.
//

#import "RequestHandler.h"
#import "JobApplication.h"
#import "Settings.h"

@interface RequestHandler ()

@property(nonatomic, strong, nonnull) NSURL *baseURL;

@end

@implementation RequestHandler

- (instancetype)init {

    self = [self initWithURL:[[NSURL alloc] initWithString:Settings.instance.baseURL]];

    return self;
}

- (instancetype)initWithURL:(NSURL *)url {

    self = [super init];

    if (self) {

        self.baseURL = url;
    }

    return self;
}

- (NSURLRequest *)applyRequest:(JobApplication *)application {

    NSURL *pathURL = [self.baseURL URLByAppendingPathComponent:@"apply"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:pathURL];

    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:[application toJSON] options:kNilOptions error:nil]];

    return request;
}
@end