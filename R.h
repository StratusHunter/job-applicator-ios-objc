#import <UIKit/UIKit.h>
@import Giotto;


NS_ASSUME_NONNULL_BEGIN

@interface RContentStrings: NSObject
/**
key: "applicationError"

Undefined: "Application request failed"
*/
- (NSString*)applicationError;
/**
key: "applicationReceived"

Undefined: "Application successfully received"
*/
- (NSString*)applicationReceived;
/**
key: "ok"

Undefined: "OK"
*/
- (NSString*)ok;
@end


@interface RStrings: NSObject
- (RContentStrings*)content;
@end


@interface RImages: NSObject
@end


@interface RStyle: NSObject
@property (nonatomic, strong) NSString* identifier;
- (void)applyTo:(nullable id)object;
@end


@interface RConstants: NSObject
- (UIColor*)COLOR_DARKJAZZBLUE;
- (UIColor*)COLOR_JAZZBLUE;
- (UIFont*)FONT_BUTTON;
- (UIFont*)FONT_HEADING;
- (UIFont*)FONT_INPUT;
@end


@interface RStyles: NSObject
@end


@interface RThemes: NSObject
- (RConstants*)constants;
- (RStyles*)styles;
@end


@interface RLaunchScreen: NSObject
- (__kindof UIViewController*)instantiateInitialViewController;
@end


@interface RMain: NSObject
- (__kindof UIViewController*)instantiateInitialViewController;
@end


@interface RStoryboards: NSObject
- (RLaunchScreen*)launchScreen;
- (RMain*)main;
@end


@interface RSegue: NSObject
@property (nonatomic, strong) NSString* identifier;
- (void)performWithSource:(__kindof UIViewController*)sourceViewController sender:(id)sender;
@end


@interface RSegues: NSObject
@end


@interface R: NSObject
+ (RStrings*)string;
+ (RImages*)image;
+ (RThemes*)theme;
+ (RStoryboards*)storyboard;
+ (RSegues*)segue;
@end


NS_ASSUME_NONNULL_END