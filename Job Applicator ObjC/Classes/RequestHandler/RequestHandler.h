//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JobApplication;

@interface RequestHandler : NSObject

- (nonnull NSURLRequest *)applyRequest:(nonnull JobApplication *)application;

@end