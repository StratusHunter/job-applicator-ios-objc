//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "Fonts.h"

static NSString *const ROCKWELL = @"Rockwell";
static NSString *const ROCKWELL_BOLD = @"Rockwell-Bold";

@implementation Fonts

+ (UIFont *)HEADING_FONT {

    return [UIFont fontWithName:ROCKWELL_BOLD size:17.f];
}

+ (UIFont *)INPUT_FONT {

    return [UIFont fontWithName:ROCKWELL size:17.f];
}

+ (UIFont *)BUTTON_FONT {

    return [UIFont fontWithName:ROCKWELL_BOLD size:17.f];
}

@end