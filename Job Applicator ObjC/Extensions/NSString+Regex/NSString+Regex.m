//
// Created by Terence Baker on 2019-03-25.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)

- (BOOL)isEmail {

    return [self isValid:@".+@.+\\.[A-Za-z]{2}[A-Za-z]*"];
}

- (BOOL)isValid:(NSString *)regex {

    NSError *error = nil;
    NSRegularExpression *recognizer = [[NSRegularExpression alloc] initWithPattern:regex options:kNilOptions error:&error];

    if (error != nil) {
        return NO;
    }

    return [recognizer matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)].count > 0;
}
@end