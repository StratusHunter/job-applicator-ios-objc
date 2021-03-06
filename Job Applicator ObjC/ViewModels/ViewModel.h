//
// Created by Terence Baker on 2019-03-25.
//

#import <UIKit/UIKit.h>

@class JobApplication;

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

- (instancetype)initWithSession:(NSURLSession *)session;

- (BOOL)validateApplicationWithName:(NSString *)name email:(NSString *)email teams:(NSString *)teams about:(NSString *)about urls:(NSString *)urls;
- (JobApplication *)createApplicationWithName:(NSString *)name email:(NSString *)email teams:(NSString *)teams about:(NSString *)about urls:(NSString *)urls;
- (void)performApplyRequest:(JobApplication *)application completionHandler:(void (^)(JobApplication *__nullable, NSError *__nullable))completionHandler;

@end

NS_ASSUME_NONNULL_END