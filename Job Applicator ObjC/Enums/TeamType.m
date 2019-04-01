//
// Created by Terence Baker on 2019-03-25.
//

#import "TeamType.h"

@implementation TeamType

+ (NSArray<Team> *)allTeams {

    return @[TeamAndroid, TeamIos, TeamFrontend, TeamBackend, TeamDesign];
}

+ (nullable Team)teamWithString:(NSString *)rawValue {

    for (Team team in self.allTeams) {

        if ([team isEqualToString:rawValue]) {

            return team;
        }
    }

    return nil;
}

@end
