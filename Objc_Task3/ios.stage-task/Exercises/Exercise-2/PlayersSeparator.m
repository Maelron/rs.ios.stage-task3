#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if (ratingArray.count < 3) {
        return 0;
    }
    
    NSInteger count = 0;

    for (int i = 0; i < ratingArray.count; i++) {
        for (int j = i + 1; j < ratingArray.count; j++) {
            for (int k = j + 1; k < ratingArray.count; k++) {
                if ((ratingArray[i].integerValue < ratingArray[j].integerValue && ratingArray[j].integerValue < ratingArray[k].integerValue) ||
                    (ratingArray[i].integerValue > ratingArray[j].integerValue && ratingArray[j].integerValue > ratingArray[k].integerValue)) {
                    count++;
                }
            }
        }
    }
    
    return count;
}

@end
