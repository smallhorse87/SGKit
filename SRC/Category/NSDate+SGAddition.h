//
//  NSDate+CXSAdded.h
//  Pomodoroom
//
//  Created by chen xiaosong on 16/8/5.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SGAddition)

- (NSString *)sg_dayRangeStart;
- (NSString *)sg_weekRangeStart;
- (NSString *)sg_monthRangeStart;

+ (NSString*)sg_stringForPeriodKey:(NSString*)periodKey;

#pragma mark - Component Properties
///=============================================================================
/// @name Component Properties
///=============================================================================

@property (nonatomic, readonly) NSInteger sg_year; ///< Year component
@property (nonatomic, readonly) NSInteger sg_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger sg_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger sg_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger sg_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger sg_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger sg_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger sg_weekday; ///< Weekday component (1~7, first day is Monday)
@property (nonatomic, readonly) NSString  *sg_weekdaySymbol;
@property (nonatomic, readonly) NSInteger sg_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger sg_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger sg_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger sg_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger sg_quarter; ///< Quarter component
@property (nonatomic, readonly) NSDate    *sg_nextDay; // return very beginning time of next day
@property (nonatomic, readonly) NSDate    *sg_lastDay; // return very beginning time of last day

@property (nonatomic, readonly) NSDate *sg_firstMomentOfThisDay;//return very beginngin time of this date

@property (nonatomic, readonly) NSDate *sg_firstMomentOfThisMonth;//return first date of week
@property (nonatomic, readonly) NSDate *sg_lastMomentOfThisMonth; //return last  date of week

@property (nonatomic, readonly) NSDate *sg_firstMomentOfThisWeek;//return first date of week
@property (nonatomic, readonly) NSDate *sg_lastMomentOfThisWeek; //return  last date of week

@property (nonatomic, readonly) BOOL sg_isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL sg_isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL sg_isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL sg_isYesterday; ///< whether date is yesterday (based on current locale)

+ (NSDate*)sg_now;
+ (NSDateComponents *)sg_currentDateComponents;
+ (NSInteger)sg_currentYear;
+ (NSInteger)sg_currentMonth;
+ (NSInteger)sg_currentDay;
+ (NSInteger)sg_currentWeekday;
+ (NSString*)sg_currentWeekdaySymbol;
+ (NSInteger)sg_getDaysWithYear:(NSInteger)year month:(NSInteger)month;

#pragma mark - Date modify
///=============================================================================
/// @name symbols
///=============================================================================
+(NSArray*)sg_weekDaySymbols;
+(NSArray*)sg_shortWeekDaySymbols;
///=============================================================================
/// @name make judgement
///=============================================================================
- (BOOL)sg_isWithinPeriod:(NSDate *)fromDate toDate:(NSDate *)toDate;

///=============================================================================
/// @name Date diff
///=============================================================================
- (NSInteger)sg_diffDayToDate:(NSDate *)toDate;
- (NSInteger)sg_diffWeekToDate:(NSDate *)toDate;
- (NSInteger)sg_diffMonthToDate:(NSDate *)toDate;

///=============================================================================
/// @name Date Compare
///=============================================================================
+ (NSDate*)sg_compareMaxDay:(NSDate*)first with:(NSDate*)second;
+ (NSDate*)sg_compareMinDay:(NSDate*)first with:(NSDate*)second;

- (BOOL)sg_isLaterOrSameDay:(NSDate*)date; //精度为天
- (BOOL)sg_isLaterThanTime:(NSDate*)date;      //精度为秒
- (BOOL)sg_isSameDay:(NSDate *)date;

///=============================================================================
/// @name Date modify
///=============================================================================

/**
 Returns a date representing the receiver date shifted later by the provided number of years.
 
 @param years  Number of years to add.
 @return Date modified by the number of desired years.
 */
- (nullable NSDate *)sg_dateByAddingYears:(NSInteger)years;

/**
 Returns a date representing the receiver date shifted later by the provided number of months.
 
 @param months  Number of months to add.
 @return Date modified by the number of desired months.
 */
- (nullable NSDate *)sg_dateByAddingMonths:(NSInteger)months;

/**
 Returns a date representing the receiver date shifted later by the provided number of weeks.
 
 @param weeks  Number of weeks to add.
 @return Date modified by the number of desired weeks.
 */
- (nullable NSDate *)sg_dateByAddingWeeks:(NSInteger)weeks;

/**
 Returns a date representing the receiver date shifted later by the provided number of days.
 
 @param days  Number of days to add.
 @return Date modified by the number of desired days.
 */
- (nullable NSDate *)sg_dateByAddingDays:(NSInteger)days;

/**
 Returns a date representing the receiver date shifted later by the provided number of hours.
 
 @param hours  Number of hours to add.
 @return Date modified by the number of desired hours.
 */
- (nullable NSDate *)sg_dateByAddingHours:(NSInteger)hours;

/**
 Returns a date representing the receiver date shifted later by the provided number of minutes.
 
 @param minutes  Number of minutes to add.
 @return Date modified by the number of desired minutes.
 */
- (nullable NSDate *)sg_dateByAddingMinutes:(NSInteger)minutes;

/**
 Returns a date representing the receiver date shifted later by the provided number of seconds.
 
 @param seconds  Number of seconds to add.
 @return Date modified by the number of desired seconds.
 */
- (nullable NSDate *)sg_dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format
///=============================================================================
/// @name Date Format
///=============================================================================
-(NSString *)sg_standardShortString;
-(NSString *)sg_standardString;
-(NSString *)sg_stringYYYYminusMM;
-(NSString *)sg_stringMMslashDD;
-(NSString *)sg_stringMMminusDD;
-(NSString *)sg_stringMslashD;
//stony
//-(NSString *)sg_stringMMDDWord;
//-(NSString *)sg_stringMDWord;
//-(NSString *)sg_stringYYYYMMDDWord;
-(NSString *)sg_stringFullTime;
-(NSString *)sg_stringYYYYminusM;
-(NSString *)sg_stringYYYYminusMminusD;
-(NSString *)sg_stringHHcolonMM;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (NSDate *)sg_dateWithStandardString:(NSString *)dateString;
+ (nullable NSDate *)sg_dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 @param timeZone   The time zone, can be nil.
 @param locale     The locale, can be nil.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)sg_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;

/**
 Returns a date parsed from given string interpreted using the ISO8601 format.
 
 @param dateString The date string in ISO8601 format. e.g. "2010-07-09T16:13:30+12:00"
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)sg_dateWithISOFormatString:(NSString *)dateString;

+ (nonnull NSDate*)sg_minDate;
+ (nonnull NSDate*)sg_maxDate;
+ (nonnull NSDate*)sg_endlessDate;
- (BOOL)sg_isEndlessDate;

+ (NSInteger)sg_elapsedDaysOfThisMonth:(NSDate*)toDate from:(NSDate*)fromDate;
+ (NSInteger)sg_elapsedDaysOfThisWeek:(NSDate*)toDate from:(NSDate*)fromDate;

+ (NSString*)sg_displayXValue:(NSString*)periodStr repeatMode:(NSInteger)mode;
+ (NSString*)sg_displayXFullValue:(NSString*)periodStr repeatMode:(NSInteger)mode;

@end
