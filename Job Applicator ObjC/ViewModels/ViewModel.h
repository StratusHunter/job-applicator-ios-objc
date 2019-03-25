//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JobApplication;

@interface ViewModel : NSObject

- (BOOL)validateApplicationWithName:(nonnull NSString *)name email:(nonnull NSString *)email teams:(nonnull NSString *)teams about:(nonnull NSString *)about urls:(nonnull NSString *)urls;
- (nonnull JobApplication *)createApplicationWithName:(nonnull NSString *)name email:(nonnull NSString *)email teams:(nonnull NSString *)teams about:(nonnull NSString *)about urls:(nonnull NSString *)urls;
- (void)performApplyRequest:(nonnull JobApplication *)application completionHandler:(void (^)(JobApplication *, NSError *))completionHandler;

@end