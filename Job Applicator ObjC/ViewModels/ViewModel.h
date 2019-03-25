//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewModel : NSObject

- (BOOL)validateApplication:(nonnull NSString *)name :(nonnull NSString *)email :(nonnull NSString *)teams :(nonnull NSString *)about :(nonnull NSString *)urls;

@end