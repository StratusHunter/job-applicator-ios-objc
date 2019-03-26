//
// Created by Terence Baker on 2019-03-26.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "NSURL+Valid.h"

@implementation NSURL (Valid)

- (BOOL)isValid {

    return self.host && self.scheme;
}

@end