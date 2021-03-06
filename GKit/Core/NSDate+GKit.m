//
// Created by Cao Hua <glare.ch@gmail.com> on 2012
// Copyright 2012 GKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "NSDate+GKit.h"
#import "GMath.h"
#import "GMacros.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
NSTimeInterval GTimeIntervalFromMinitues(CGFloat minutes)
{
    return minutes * 60;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
NSTimeInterval GTimeIntervalFromHours(CGFloat hours)
{
    return GTimeIntervalFromMinitues(hours * 60);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
NSTimeInterval GTimeIntervalFromDays(CGFloat days)
{
    return GTimeIntervalFromHours(days * 24);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
NSTimeInterval GTimeIntervalFromWeeks(CGFloat weeks)
{
    return GTimeIntervalFromDays(weeks * 7);
}

/////////////////////////////////////////////////////////////////
NSString * GTimerElementStringFormElement(NSUInteger element)
{
    return [NSString stringWithFormat:(element<10?@"0%d":@"%d"),element];
}
NSString * GTimerStringFromTimeInterval(NSTimeInterval timeInterval)
{
    NSUInteger min = gfloor(timeInterval/60);
	NSUInteger sec = gfloor(timeInterval-60*min);
	return [NSString stringWithFormat:@"%@:%@",
            GTimerElementStringFormElement(min),
            GTimerElementStringFormElement(sec)];
}

@implementation NSDate (GKit)

//string from date
- (NSString *)dateStringWithFormat:(NSString *)dateFormat
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:dateFormat];
	return [formatter stringFromDate:self];
}
//date from date
- (NSDate *)dateWithFormat:(NSString *)dateFormat
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:dateFormat];
	return [formatter dateFromString:[formatter stringFromDate:self]];
}
//hour string
- (NSString *)hourString
{
	return [self dateStringWithFormat:@"HH"];
}
//min string
- (NSString *)minuteString
{
	return [self dateStringWithFormat:@"mm"];
}

///////////////
- (GWeekdayType)weekday
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components: GDateComponents
                                                        fromDate: self];
    return components.weekday;
}
- (NSDate *)beginningOfDay
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components: GDateComponents
                                                        fromDate: self];
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	return [gregorianCalendar dateFromComponents:components];
}
- (NSDate *)beginningOfWeekWithFirstWeekday:(GWeekdayType)firstWeekday
{
    GWeekdayType weekday = [self weekday];
    NSDate *beginningOfDay = [self beginningOfDay];
    NSInteger daysToSubtract = weekday-firstWeekday;
    if (daysToSubtract<0) daysToSubtract += GDaysInWeek;
    
    return [beginningOfDay dateByAddingTimeInterval:-GTimeIntervalFromDays(daysToSubtract)];
}

////////////////////////////////////////////////////////////////////////
+ (NSInteger)numberOfDaysForMonth:(NSInteger)month inYear:(NSInteger)year {

    switch (month) {
        //1 3 5 7 8 10 12
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        // 2
        case 2:
            if((year%100!=0 && year%4==0) ||
               year%400==0) {
                // leap month
                return 29;
            } else {
                return 28;
            }
        // others
        default:
            return 30;
    }
}

@end
