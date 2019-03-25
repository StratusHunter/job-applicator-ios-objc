//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSON <NSObject>

- (NSDictionary *)toJSON;
- (instancetype)initWithJSON:(NSDictionary *)json;
@end