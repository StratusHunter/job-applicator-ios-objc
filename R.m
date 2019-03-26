#import "R.h"


@implementation RContentStrings
- (NSString*)applicationError { return NSLocalizedStringFromTableInBundle(@"applicationError", @"Content", [NSBundle bundleForClass:self.class], nil); }
- (NSString*)applicationReceived { return NSLocalizedStringFromTableInBundle(@"applicationReceived", @"Content", [NSBundle bundleForClass:self.class], nil); }
- (NSString*)ok { return NSLocalizedStringFromTableInBundle(@"ok", @"Content", [NSBundle bundleForClass:self.class], nil); }
@end


@interface RStrings ()
@property (nonatomic, strong) RContentStrings* content;
@end

@implementation RStrings

- (RContentStrings*)content
{
	if (!_content)
	{
		_content = [RContentStrings new];
	}
	return _content;
}

@end



@implementation RImages

@end



@implementation RStyle
- (void)applyTo:(nullable id)object { SDThemeManagerApplyStyle(self.identifier, object); }
@end



@implementation RConstants
- (UIColor*)COLOR_DARKJAZZBLUE { return SDThemeManagerValueForConstant(@"COLOR_DARKJAZZBLUE"); }
- (UIColor*)COLOR_JAZZBLUE { return SDThemeManagerValueForConstant(@"COLOR_JAZZBLUE"); }
- (UIFont*)FONT_BUTTON { return SDThemeManagerValueForConstant(@"FONT_BUTTON"); }
- (UIFont*)FONT_HEADING { return SDThemeManagerValueForConstant(@"FONT_HEADING"); }
- (UIFont*)FONT_INPUT { return SDThemeManagerValueForConstant(@"FONT_INPUT"); }
@end



@implementation RStyles

@end


@interface RThemes ()
@property (nonatomic, strong) RConstants* constants;
@property (nonatomic, strong) RStyles* styles;
@end

@implementation RThemes

- (RConstants*)constants
{
	if (!_constants)
	{
		_constants = [RConstants new];
	}
	return _constants;
}

- (RStyles*)styles
{
	if (!_styles)
	{
		_styles = [RStyles new];
	}
	return _styles;
}

@end



@implementation RLaunchScreen
- (__kindof UIViewController*)instantiateInitialViewController { return [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateInitialViewController]; }
@end



@implementation RMain
- (__kindof UIViewController*)instantiateInitialViewController { return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController]; }
@end


@interface RStoryboards ()
@property (nonatomic, strong) RLaunchScreen* launchScreen;
@property (nonatomic, strong) RMain* main;
@end

@implementation RStoryboards

- (RLaunchScreen*)launchScreen
{
	if (!_launchScreen)
	{
		_launchScreen = [RLaunchScreen new];
	}
	return _launchScreen;
}

- (RMain*)main
{
	if (!_main)
	{
		_main = [RMain new];
	}
	return _main;
}

@end



@implementation RSegue
- (void)performWithSource:(__kindof UIViewController*)sourceViewController sender:(id)sender { [sourceViewController performSegueWithIdentifier:self.identifier sender:sender]; }
@end



@implementation RSegues

@end


@interface R ()
@property (nonatomic, strong) RStrings* string;
@property (nonatomic, strong) RImages* image;
@property (nonatomic, strong) RThemes* theme;
@property (nonatomic, strong) RStoryboards* storyboard;
@property (nonatomic, strong) RSegues* segue;
@end

@implementation R

+ (instancetype)sharedInstance
{	 
	static dispatch_once_t pred;
 	static id sharedInstance_ = nil;
 
 	dispatch_once(&pred, ^{
 		sharedInstance_ = [[self alloc] init];
 	});
 
 	return sharedInstance_;

}

+ (RStrings*)string { return [[R sharedInstance] string]; }
+ (RImages*)image { return [[R sharedInstance] image]; }
+ (RThemes*)theme { return [[R sharedInstance] theme]; }
+ (RStoryboards*)storyboard { return [[R sharedInstance] storyboard]; }
+ (RSegues*)segue { return [[R sharedInstance] segue]; }

- (RStrings*)string
{
	if (!_string)
	{
		_string = [RStrings new];
	}
	return _string;
}

- (RImages*)image
{
	if (!_image)
	{
		_image = [RImages new];
	}
	return _image;
}

- (RThemes*)theme
{
	if (!_theme)
	{
		_theme = [RThemes new];
	}
	return _theme;
}

- (RStoryboards*)storyboard
{
	if (!_storyboard)
	{
		_storyboard = [RStoryboards new];
	}
	return _storyboard;
}

- (RSegues*)segue
{
	if (!_segue)
	{
		_segue = [RSegues new];
	}
	return _segue;
}

@end


