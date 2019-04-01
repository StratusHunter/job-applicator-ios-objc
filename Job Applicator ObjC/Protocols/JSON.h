//
// Created by Terence Baker on 2019-03-25.
//

#import <Foundation/Foundation.h>

@protocol JSON <NSObject>

- (NSDictionary *)toJSON;
- (instancetype)initWithJSON:(NSDictionary *)json;
@end