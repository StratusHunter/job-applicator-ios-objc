//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (instancetype)instance {

    static Settings *settings = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

        settings = [Settings new];
    });

    return settings;
}

- (instancetype)init {

    self = [super init];

    if (self) {

        _baseURL = NSBundle.mainBundle.infoDictionary[@"baseURL"];
    }

    return self;
}
@end