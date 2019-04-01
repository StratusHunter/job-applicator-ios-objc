//
// Created by Terence Baker on 2019-03-25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject

@property(nonatomic, strong, readonly) NSString *baseURL;

+ (instancetype)instance;

@end

NS_ASSUME_NONNULL_END