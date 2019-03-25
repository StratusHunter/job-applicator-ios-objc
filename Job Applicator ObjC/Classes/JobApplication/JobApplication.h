//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"

@interface JobApplication : NSObject <JSON>

@property(nonatomic, strong, nonnull) NSString *name;
@property(nonatomic, strong, nonnull) NSString *email;
@property(nonatomic, strong, nonnull) NSString *about;
@property(nonatomic, strong, nonnull) NSArray<NSString *> *urls;
@property(nonatomic, strong, nonnull) NSArray<NSString *> *teams;

- (instancetype)initWithName:(NSString *)name email:(NSString *)email about:(NSString *)about teams:(NSArray <NSString *> *)teams urls:(NSArray <NSString *> *)urls;
@end