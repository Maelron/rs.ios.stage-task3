#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber <= 0 || monthNumber > 12) {
        return nil;
    }
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setMonth:monthNumber];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MMMM"];
   
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *initialFormatter = [NSDateFormatter new];
    [initialFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    
    NSDate *inputDate = [initialFormatter dateFromString:date];
    
    NSDateFormatter *resultFormatter = [NSDateFormatter new];
    [resultFormatter setDateFormat:@"dd"];
        
    return [[resultFormatter stringFromDate:inputDate] integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"E"];
    NSLocale *rusLocale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setLocale:rusLocale];
    
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [currentCalendar setLocale:[NSLocale currentLocale]];

    NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitWeekOfMonth fromDate:[NSDate now]];
    
    NSInteger thisWeek = [dateComponents weekOfMonth];

    NSDateComponents *anotherComponents = [currentCalendar components:NSCalendarUnitWeekOfMonth fromDate:date];
    
    NSInteger weekToCompare = [anotherComponents weekOfMonth];
    
    if (thisWeek == weekToCompare) {
        return YES;
    } else {
        return NO;
    }
}

@end
