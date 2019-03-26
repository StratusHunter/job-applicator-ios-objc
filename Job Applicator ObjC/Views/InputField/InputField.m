//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "InputField.h"
#import "R.h"

static const UIEdgeInsets edgeInset = {8, 8, 8, 8};

@implementation InputField {
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if (self) {

        [self setup];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];

    if (self) {

        [self setup];
    }

    return self;
}

- (void)setup {

    self.borderStyle = UITextBorderStyleNone;

    self.backgroundColor = [R.theme.constants.COLOR_DARKJAZZBLUE colorWithAlphaComponent:0.5f];
    self.textColor = UIColor.whiteColor;
    self.tintColor = UIColor.whiteColor;

    self.font = R.theme.constants.FONT_INPUT;
}

- (CGRect)textRectForBounds:(CGRect)bounds {

    return [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, edgeInset)];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {

    return [super editingRectForBounds:UIEdgeInsetsInsetRect(bounds, edgeInset)];
}

@end
