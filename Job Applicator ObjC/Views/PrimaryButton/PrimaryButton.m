//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "PrimaryButton.h"
#import "R.h"

@implementation PrimaryButton {
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

- (void)setEnabled:(BOOL)enabled {

    [super setEnabled:enabled];
    self.alpha = (enabled) ? 1.0f : 0.5f;
}

- (void)setup {

    self.backgroundColor = UIColor.whiteColor;

    [self setTitleColor:R.theme.constants.COLOR_JAZZBLUE forState:UIControlStateNormal];

    self.titleLabel.font = R.theme.constants.FONT_BUTTON;

    self.titleEdgeInsets = UIEdgeInsetsMake(4, 0, 0, 0);
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height / 2.0f;
}

@end
