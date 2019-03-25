//
// Created by Terence Baker on 2019-03-25.
// Copyright (c) 2019 Bulb Studios Ltd. All rights reserved.
//

#import "InputView.h"
#import "Fonts.h"

@implementation InputView

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

    self.indicatorStyle = UIScrollViewIndicatorStyleWhite;

    self.textContainer.lineFragmentPadding = 0;
    self.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);

    self.backgroundColor = [[UIColor colorNamed:@"DarkJazzBlue"] colorWithAlphaComponent:0.5];
    self.textColor = UIColor.whiteColor;
    self.tintColor = UIColor.whiteColor;

    self.font = Fonts.INPUT_FONT;
}
@end
