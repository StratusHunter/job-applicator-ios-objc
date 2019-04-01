//
// Created by Terence Baker on 2019-03-25.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *Team NS_TYPED_ENUM;
static Team const TeamAndroid = @"android";
static Team const TeamIos = @"ios";
static Team const TeamBackend = @"backend";
static Team const TeamFrontend = @"frontend";
static Team const TeamDesign = @"design";
//Update allTeams when new team added

@interface TeamType : NSObject

+ (NSArray<Team> *)allTeams;
+ (nullable Team)teamWithString:(NSString *)rawValue;

@end

NS_ASSUME_NONNULL_END
