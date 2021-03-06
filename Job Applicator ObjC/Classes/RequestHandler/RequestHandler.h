//
// Created by Terence Baker on 2019-03-25.
//

#import <UIKit/UIKit.h>

@class JobApplication;
NS_ASSUME_NONNULL_BEGIN

@interface RequestHandler : NSObject

- (instancetype)init;
- (instancetype)initWithURL:(NSURL *)url;
- (NSURLRequest *)applyRequest:(JobApplication *)application;

@end

NS_ASSUME_NONNULL_END