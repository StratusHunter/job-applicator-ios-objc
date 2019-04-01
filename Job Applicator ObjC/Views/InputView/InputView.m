//
// Created by Terence Baker on 2019-03-25.
//

#import "InputView.h"
#import "R.h"

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

    self.backgroundColor = [R.theme.constants.COLOR_DARKJAZZBLUE colorWithAlphaComponent:0.5];
    self.textColor = UIColor.whiteColor;
    self.tintColor = UIColor.whiteColor;

    self.font = R.theme.constants.FONT_INPUT;
}
@end
