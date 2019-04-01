//
// Created by Terence Baker on 2019-03-26.
//

#import "NSURL+Valid.h"

@implementation NSURL (Valid)

- (BOOL)isValid {

    return self.host && self.scheme;
}

@end