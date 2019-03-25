//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Team) {
    android,
    ios,
    backend,
    frontend,
    design
};

@interface TeamType : NSObject

@property(nonatomic, assign, readonly) Team team;

+ (nullable TeamType *)createWithString:(NSString *)rawValue;

- (instancetype)initWithTeam:(Team)team;
- (NSString *)string;
@end