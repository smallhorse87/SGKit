//
//  NSDate+CXSAdded.h
//  Pomodoroom
//
//  Created by chen xiaosong on 16/8/5.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SGAddition)

- (NSString *)dayRangeStart;
- (NSString *)weekRangeStart;
- (NSString *)monthRangeStart;

+ (NSString*)stringForPeriodKey:(NSString*)periodKey;

#pragma mark - Component Properties
///=============================================================================
/// @name Component Properties
///=============================================================================

@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger weekday; ///< Weekday component (1~7, first day is Monday)
@property (nonatomic, readonly) NSString  *weekdaySymbol;
@property (nonatomic, readonly) NSInteger weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger quarter; ///< Quarter component
@property (nonatomic, readonly) NSDate    *nextDay; // return very beginning time of next day
@property (nonatomic, readonly) NSDate    *lastDay; // return very beginning time of last day

@property (nonatomic, readonly) NSDate *firstMomentOfThisDay;//return very beginngin time of this date

@property (nonatomic, readonly) NSDate *firstMomentOfThisMonth;//return first date of week
@property (nonatomic, readonly) NSDate *lastMomentOfThisMonth; //return last  date of week

@property (nonatomic, readonly) NSDate *firstMomentOfThisWeek;//return first date of week
@property (nonatomic, readonly) NSDate *lastMomentOfThisWeek; //return  last date of week

@property (nonatomic, readonly) BOOL isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL isYesterday; ///< whether date is yesterday (based on current locale)

+ (NSDate*)now;
+ (NSDateComponents *)currentDateComponents;
+ (NSInteger)currentYear;
+ (NSInteger)currentMonth;
+ (NSInteger)currentDay;
+ (NSInteger)currentWeekday;
+ (NSString*)currentWeekdaySymbol;
+ (NSInteger)getDaysWithYear:(NSInteger)year month:(NSInteger)month;

#pragma mark - Date modify
///=============================================================================
/// @name symbols
///=============================================================================
+(NSArray*)weekDaySymbols;
+(NSArray*)shortWeekDaySymbols;
///=============================================================================
/// @name make judgement
///=============================================================================
- (BOOL)isWithinPeriod:(NSDate *)fromDate toDate:(NSDate *)toDate;

///=============================================================================
/// @name Date diff
///=============================================================================
- (NSInteger)diffDayToDate:(NSDate *)toDate;
- (NSInteger)diffWeekToDate:(NSDate *)toDate;
- (NSInteger)diffMonthToDate:(NSDate *)toDate;

///=============================================================================
/// @name Date Compare
///=============================================================================
+ (NSDate*)compareMaxDay:(NSDate*)first with:(NSDate*)second;
+ (NSDate*)compareMinDay:(NSDate*)first with:(NSDate*)second;

- (BOOL)isLaterOrSameDay:(NSDate*)date; //精度为天
- (BOOL)isLaterThanTime:(NSDate*)date;      //精度为秒
- (BOOL)isSameDay:(NSDate *)date;

///=============================================================================
/// @name Date modify
///=============================================================================

/**
 Returns a date representing the receiver date shifted later by the provided number of years.
 
 @param years  Number of years to add.
 @return Date modified by the number of desired years.
 */
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;

/**
 Returns a date representing the receiver date shifted later by the provided number of months.
 
 @param months  Number of months to add.
 @return Date modified by the number of desired months.
 */
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 Returns a date representing the receiver date shifted later by the provided number of weeks.
 
 @param weeks  Number of weeks to add.
 @return Date modified by the number of desired weeks.
 */
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 Returns a date representing the receiver date shifted later by the provided number of days.
 
 @param days  Number of days to add.
 @return Date modified by the number of desired days.
 */
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;

/**
 Returns a date representing the receiver date shifted later by the provided number of hours.
 
 @param hours  Number of hours to add.
 @return Date modified by the number of desired hours.
 */
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 Returns a date representing the receiver date shifted later by the provided number of minutes.
 
 @param minutes  Number of minutes to add.
 @return Date modified by the number of desired minutes.
 */
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 Returns a date representing the receiver date shifted later by the provided number of seconds.
 
 @param seconds  Number of seconds to add.
 @return Date modified by the number of desired seconds.
 */
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format
///=============================================================================
/// @name Date Format
///=============================================================================
-(NSString *)standardShortString;
-(NSString *)standardString;
-(NSString *)stringYYYYminusMM;
-(NSString *)stringMMslashDD;
-(NSString *)stringMMminusDD;
-(NSString *)stringMslashD;
-(NSString *)stringMMDDWord;
-(NSString *)stringMDWord;
-(NSString *)stringYYYYMMDDWord;
-(NSString *)stringFullTime;
-(NSString *)stringYYYYminusM;
-(NSString *)stringYYYYminusMminusD;
-(NSString *)stringHHcolonMM;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (NSDate *)dateWithStandardString:(NSString *)dateString;
+ (nullable NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 @param timeZone   The time zone, can be nil.
 @param locale     The locale, can be nil.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;

/**
 Returns a date parsed from given string interpreted using the ISO8601 format.
 
 @param dateString The date string in ISO8601 format. e.g. "2010-07-09T16:13:30+12:00"
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithISOFormatString:(NSString *)dateString;

+ (nonnull NSDate*)minDate;
+ (nonnull NSDate*)maxDate;
+ (nonnull NSDate*)endlessDate;
- (BOOL)isEndlessDate;

+ (NSInteger)elapsedDaysOfThisMonth:(NSDate*)toDate from:(NSDate*)fromDate;
+ (NSInteger)elapsedDaysOfThisWeek:(NSDate*)toDate from:(NSDate*)fromDate;

+ (NSString*)displayXValue:(NSString*)periodStr repeatMode:(NSInteger)mode;
+ (NSString*)displayXFullValue:(NSString*)periodStr repeatMode:(NSInteger)mode;

@end
