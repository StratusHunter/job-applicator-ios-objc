//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobApplication : NSObject <JSON>

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *about;
@property(nonatomic, strong) NSArray<NSString *> *urls;
@property(nonatomic, strong) NSArray<NSString *> *teams;

- (instancetype)initWithName:(NSString *)name email:(NSString *)email about:(NSString *)about teams:(NSArray <NSString *> *)teams urls:(NSArray <NSString *> *)urls;
@end

NS_ASSUME_NONNULL_END