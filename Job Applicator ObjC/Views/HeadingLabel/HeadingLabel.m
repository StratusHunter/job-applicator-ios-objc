//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "HeadingLabel.h"
#import "Fonts.h"

@implementation HeadingLabel {
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

    self.textColor = UIColor.whiteColor;
    self.font = Fonts.HEADING_FONT;
}

- (void)drawTextInRect:(CGRect)rect {

    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(2, 0, 0, 0))];
}
@end
