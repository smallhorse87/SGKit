//
//  NSDate+CXSAdded.m
//  Pomodoroom
//
//  Created by chen xiaosong on 16/8/5.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import "NSDate+SGAddition.h"

#import <time.h>

static NSDictionary *standardStrToDateDic = nil;

@implementation NSDate (SGAddition)

// default Sunday->1
- (NSString *)sg_dayRangeStart
{
    NSDate *firstMoment = self.sg_firstMomentOfThisDay;
    
    NSString *dayRange = [NSString stringWithFormat:@"%ld",(NSInteger)firstMoment.timeIntervalSince1970];

    return dayRange;
}

- (NSString *)sg_weekRangeStart
{
    NSDate *beginingOfWeek = self.sg_firstMomentOfThisWeek;

    NSString *weekRange = [NSString stringWithFormat:@"%ld",(NSInteger)beginingOfWeek.timeIntervalSince1970];

    return weekRange;
}

-(NSString *)sg_monthRangeStart
{
    NSDate *beginingOfMonth = self.sg_firstMomentOfThisMonth;

    NSString *monthRange = [NSString stringWithFormat:@"%ld",(NSInteger)beginingOfMonth.timeIntervalSince1970];;
    
    return monthRange;
}

+ (NSString*)sg_stringForPeriodKey:(NSString*)periodKey
{
    NSArray *dateArr = [periodKey componentsSeparatedByString:@" "];

    NSDate *startDate = [NSDate sg_dateWithStandardString:dateArr[0]];
    NSDate *endDate   = [NSDate sg_dateWithStandardString:dateArr[1]];
    NSDate *now       = [NSDate sg_now];

    BOOL todayWithinPeriod = [now sg_isWithinPeriod:startDate toDate:endDate];

    NSString *periodStr;
    NSString *extraStr = @"";

    NSInteger diffDays = [startDate sg_diffDayToDate:endDate];

    if (diffDays == 0) {
        //按天
        periodStr = [startDate sg_stringMMslashDD];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(Today)",@"date");
        }
        
    } else if(diffDays == 7 - 1) {
        //按周
        periodStr = [NSString stringWithFormat:@"%@ - %@", [startDate sg_stringMMslashDD], [endDate sg_stringMMslashDD]];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(This week)",@"date");
        }
        
    } else {
        //按月
        periodStr = [NSString stringWithFormat:@"%@ - %@", [startDate sg_stringMMslashDD], [endDate sg_stringMMslashDD]];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(This month)",@"date");
        }
    }

    return [periodStr stringByAppendingString:extraStr];
}

+ (NSCalendar *)sg_gregorianCalendar
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    calendar.firstWeekday = 2;
    
    return calendar;
}

+ (NSDateComponents *)sg_currentDateComponents
{
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    return [calendar components:unitFlags fromDate:[NSDate date]];
}

+ (NSInteger)sg_elapsedDaysOfThisMonth:(NSDate*)toDate from:(NSDate*)fromDate
{
    NSDate *firstMonthDateOfToDate = [toDate sg_firstMomentOfThisMonth];
    
    NSDate *firstMonthDateOfFromDate = [fromDate sg_firstMomentOfThisMonth];

    //起始和结束在同一月
    if ([firstMonthDateOfToDate sg_diffMonthToDate:firstMonthDateOfFromDate]==0) {
        return [fromDate sg_diffDayToDate:toDate]+1;
    } else {
        return toDate.sg_day;
    }
}

//计算当前前周的有效天数
+ (NSInteger)sg_elapsedDaysOfThisWeek:(NSDate*)toDate from:(NSDate*)fromDate
{
    NSDate *firstWeekDateOfToDate = [toDate sg_firstMomentOfThisWeek];

    NSDate *firstWeekDateOfFromDate = [fromDate sg_firstMomentOfThisWeek];
    
    //起始和结束在同一周
    if ([firstWeekDateOfToDate sg_diffWeekToDate:firstWeekDateOfFromDate]==0) {
        return [fromDate sg_diffDayToDate:toDate]+1;
    } else {
        return toDate.sg_weekday;
    }
}

+ (NSDate*)sg_now
{
    return [[NSDate alloc] init];
}

+ (NSInteger)sg_currentMonth
{
    return [self sg_currentDateComponents].month;
}

+ (NSInteger)sg_currentYear
{
    return [self sg_currentDateComponents].year;
}

+ (NSInteger)sg_currentDay
{
    return [self sg_currentDateComponents].day;
}

+ (NSInteger)sg_currentWeekday
{
    return [self sg_now].sg_weekday;
}

+ (NSString*)sg_currentWeekdaySymbol
{
    NSInteger weekday  = [self sg_now].sg_weekday;
    NSArray   *symbols = [self sg_weekDayFullEnglishSymbols];

    return symbols[weekday-1];
}

+ (NSInteger)sg_getDaysWithYear:(NSInteger)year
                       month:(NSInteger)month
{
    switch (month) {
        case 1:
            return 31;
            break;
        case 2:
            if (year%400==0 || (year%100!=0 && year%4 == 0)) {
                return 29;
            }else{
                return 28;
            }
            break;
        case 3:
            return 31;
            break;
        case 4:
            return 30;
            break;
        case 5:
            return 31;
            break;
        case 6:
            return 30;
            break;
        case 7:
            return 31;
            break;
        case 8:
            return 31;
            break;
        case 9:
            return 30;
            break;
        case 10:
            return 31;
            break;
        case 11:
            return 30;
            break;
        case 12:
            return 31;
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)sg_year {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)sg_month {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)sg_day {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)sg_hour {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)sg_minute {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)sg_second {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)sg_nanosecond {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)sg_weekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    if (components.weekday == 1) {
        return 7;
    } else {
        return components.weekday - 1;
    }
}

+(NSArray*)sg_weekDayFullEnglishSymbols
{
    return @[
             NSLocalizedString(@"Monday",@"week symbole"),
             NSLocalizedString(@"Tuesday",@"week symbole"),
             NSLocalizedString(@"Wednesday",@"week symbole"),
             NSLocalizedString(@"Thursday",@"week symbole"),
             NSLocalizedString(@"Friday",@"week symbole"),
             NSLocalizedString(@"Saturday",@"week symbole"),
             NSLocalizedString(@"Sunday",@"week symbole")
             ];
}

+(NSArray*)sg_weekDaySymbols
{
    return @[
             NSLocalizedString(@"Mon",@"week symbole"),
             NSLocalizedString(@"Tue",@"week symbole"),
             NSLocalizedString(@"Wen",@"week symbole"),
             NSLocalizedString(@"Thu",@"week symbole"),
             NSLocalizedString(@"Fri",@"week symbole"),
             NSLocalizedString(@"Sat",@"week symbole"),
             NSLocalizedString(@"Sun",@"week symbole")
             ];
}

+(NSArray*)sg_shortWeekDaySymbols
{
    return @[
             NSLocalizedString(@"Mo",@"week symbole"),
             NSLocalizedString(@"Tu",@"week symbole"),
             NSLocalizedString(@"We",@"week symbole"),
             NSLocalizedString(@"Th",@"week symbole"),
             NSLocalizedString(@"Fr",@"week symbole"),
             NSLocalizedString(@"Sa",@"week symbole"),
             NSLocalizedString(@"Su",@"week symbole")
             ];
}


- (NSString *)sg_weekdaySymbol {
    NSInteger w = self.sg_weekday;
    
    NSString *weekDay = @"";
    
    switch (w) {
        case 1: weekDay = NSLocalizedString(@"Mon",@"week symbole");    break;
        case 2: weekDay = NSLocalizedString(@"Tue",@"week symbole");    break;
        case 3: weekDay = NSLocalizedString(@"Wen",@"week symbole");    break;
        case 4: weekDay = NSLocalizedString(@"Thu",@"week symbole");    break;
        case 5: weekDay = NSLocalizedString(@"Fri",@"week symbole");    break;
        case 6: weekDay = NSLocalizedString(@"Sat",@"week symbole");    break;
        case 7: weekDay = NSLocalizedString(@"Sun",@"week symbole");    break;
        default:break;
    }
    
    return weekDay;
}

- (NSInteger)sg_weekdayOrdinal {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)sg_weekOfMonth {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)sg_weekOfYear {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)sg_yearForWeekOfYear {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)sg_quarter {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (NSDate *)sg_nextDay {
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    components.day++;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)sg_lastDay {
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    components.day--;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)sg_beginDateToUnitGranularity:(NSCalendarUnit)unit
{
    NSDate *beginDate;
    NSTimeInterval interval;
    
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    calendar.firstWeekday = 2;
    
    BOOL ok = [calendar rangeOfUnit:unit startDate:&beginDate interval:&interval forDate:self];
    
    NSAssert(ok, @"MUST be TRUE");
    
    return beginDate;
    
}

- (NSDate *)sg_endDateToUnitGranularity:(NSCalendarUnit)unit
{
    NSDate *beginDate;
    NSTimeInterval interval;
    
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    calendar.firstWeekday = 2;
    
    BOOL ok = [calendar rangeOfUnit:unit startDate:&beginDate interval:&interval forDate:self];
    
    NSAssert(ok, @"MUST be TRUE");
    
    return [beginDate dateByAddingTimeInterval:interval-1];
}

- (NSDate *)sg_firstMomentOfThisDay {
    return [self sg_beginDateToUnitGranularity:NSCalendarUnitDay];
}

- (NSDate *)sg_firstMomentOfThisMonth {
    return [self sg_beginDateToUnitGranularity:NSCalendarUnitMonth];
}

- (NSDate *)sg_lastMomentOfThisMonth {
    return [self sg_endDateToUnitGranularity:NSCalendarUnitMonth];
}

- (NSDate *)sg_firstMomentOfThisWeek {
    return [self sg_beginDateToUnitGranularity:NSCalendarUnitWeekOfMonth];
}

- (NSDate *)sg_lastMomentOfThisWeek {
    return [self sg_endDateToUnitGranularity:NSCalendarUnitWeekOfMonth];
}


- (BOOL)sg_isLeapMonth {
    return [[[NSDate sg_gregorianCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)sg_isLeapYear {
    NSUInteger year = self.sg_year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)sg_isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].sg_day == self.sg_day;
}

- (BOOL)sg_isYesterday {
    NSDate *added = [self sg_dateByAddingDays:1];
    return [added sg_isToday];
}

- (BOOL)sg_isWithinPeriod:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSInteger offsetBetweenFromDateAndToday = [fromDate sg_diffDayToDate:self];
    NSInteger offsetBetweenTodayAndEndDate  = [self     sg_diffDayToDate:toDate];
    
    if (offsetBetweenFromDateAndToday>=0 && offsetBetweenTodayAndEndDate>=0) {
        return YES;
    }
    
    return NO;
}

- (NSDate *)sg_dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSDate sg_gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sg_dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}


- (NSDate *)sg_dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sg_dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sg_dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sg_dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sg_dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

//get another date
- (NSInteger)sg_diffDayToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitDay fromDate:self.sg_firstMomentOfThisDay  toDate:toDate.sg_firstMomentOfThisDay  options:0];
    
    return [comps day];
    
}

- (NSInteger)sg_diffWeekToDate:(NSDate *)toDate
{
    NSDate *beginingWeekOfFromDate = self.sg_firstMomentOfThisWeek;
    NSDate *beginingWeekOfToDate   = toDate.sg_firstMomentOfThisWeek;
    
    NSInteger diffDay = [beginingWeekOfFromDate sg_diffDayToDate:beginingWeekOfToDate];
    
    return diffDay/7;
    
}

- (NSInteger)sg_diffMonthToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSDate sg_gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:self.sg_firstMomentOfThisMonth
                                                 toDate:toDate.sg_firstMomentOfThisMonth
                                                options:0];
    return components.month;
}

+ (NSComparisonResult)sg_compareDay:(NSDate *)first with:(NSDate *)second
{
    return [[NSDate sg_gregorianCalendar] compareDate:first toDate:second toUnitGranularity:NSCalendarUnitDay];
}

+ (NSComparisonResult)sg_compareTime:(NSDate *)first with:(NSDate *)second
{
    return [[NSDate sg_gregorianCalendar] compareDate:first toDate:second toUnitGranularity:NSCalendarUnitSecond];
}

+ (NSDate*)sg_compareMaxDay:(NSDate*)first with:(NSDate*)second
{
    NSAssert((first!=nil) && (second!=nil), @"input Can not be nil");
    
    NSAssert([first  isKindOfClass:[NSDate class]], @"input must be NSDate");
    NSAssert([second isKindOfClass:[NSDate class]], @"input must be NSDate");
    
    //大小比较 大于
    if([self sg_compareDay:first with:second] == NSOrderedAscending)
    {
        return second;
    } else {
        return first;
    }
}

+ (NSDate*)sg_compareMinDay:(NSDate *)first with:(NSDate *)second
{
    NSAssert((first!=nil) && (second!=nil), @"input Can not be nil");
    
    NSAssert([first  isKindOfClass:[NSDate class]], @"input must be NSDate");
    NSAssert([second isKindOfClass:[NSDate class]], @"input must be NSDate");
    
    //大小比较 大于
    if([self sg_compareDay:first with:second] == NSOrderedAscending)
    {
        return first;
    } else {
        return second;
    }
}

- (BOOL)sg_isLaterOrSameDay:(NSDate*)date
{
    NSComparisonResult result = [NSDate sg_compareDay:self with:date];
    
    if((result==NSOrderedDescending) || (result==NSOrderedSame))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)sg_isLaterThanTime:(NSDate*)date
{
    NSComparisonResult result = [NSDate sg_compareTime:self with:date];
    
    if((result==NSOrderedDescending) || (result==NSOrderedSame))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)sg_isSameDay:(NSDate *)date
{
    return [[NSDate sg_gregorianCalendar] isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitDay];
}

- (BOOL)sg_sameMonth:(NSDate *)date
{
    NSDate *firstMomentOfThisMonth = [self sg_firstMomentOfThisMonth];
    
    return [date sg_isSameDay:firstMomentOfThisMonth];
}

- (BOOL)sg_sameWeek:(NSDate *)date
{
    NSDate *firstMomentOfThisWeek = [self sg_firstMomentOfThisWeek];
    
    return [date sg_isSameDay:firstMomentOfThisWeek];
}

-(NSString *)sg_standardShortString
{
    return [self sg_stringWithFormat:@"yyyy-M-d"];
}

-(NSString *)sg_standardString
{
    return [self sg_stringWithFormat:@"yyyy-MM-dd"];
}

-(NSString *)sg_stringYYYYminusMminusD
{
    return [self sg_stringWithFormat:@"yyyy-M-d"];
}

-(NSString *)sg_stringYYYYminusMM
{
    return [self sg_stringWithFormat:@"yyyy-MM"];
}

-(NSString *)sg_stringYYYYminusM
{
    return [self sg_stringWithFormat:@"yyyy-M"];
}

-(NSString *)sg_stringMMslashDD
{
    return [self sg_stringWithFormat:@"MM/dd"];
}

-(NSString *)sg_stringMMminusDD
{
    return [self sg_stringWithFormat:@"MM-dd"];
}

-(NSString *)sg_stringMslashD
{
    return [self sg_stringWithFormat:@"M/d"];
}

//stony
//-(NSString *)sg_stringMMDDWord
//{
//    if ([NSLocale isChinese]) {
//        return [self sg_stringWithFormat:@"MM月dd日"];
//    } else {
//        return [self sg_stringWithFormat:@"MMM d"];
//    }
//
//}
//
//-(NSString *)sg_stringMDWord
//{
//    if ([NSLocale isChinese]) {
//        return [self sg_stringWithFormat:@"M月d日"];
//    } else {
//        return [self sg_stringWithFormat:@"MMM d"];
//    }
//
//}
//
//-(NSString *)sg_stringYYYYMMDDWord
//{
//    if ([NSLocale isChinese]) {
//        return [self sg_stringWithFormat:@"yyyy年MM月dd日"];
//    } else {
//        return [self sg_stringWithFormat:@"MMM d, yyyy"];
//    }
//
//
//}

-(NSString *)sg_stringHHcolonMM
{
    return [self sg_stringWithFormat:@"HH:mm:ss"];
}

-(NSString *)sg_stringFullTime
{
    return [self sg_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)sg_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate sg_gregorianCalendar]];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

+ (NSDate *)sg_dateWithStandardString:(NSString *)dateString{
    
    NSAssert([dateString isKindOfClass:[NSString class]], @"Must be NSString");

    if (dateString == nil || dateString.length == 0) {
        return nil;
    }
    
    NSDate *date = [NSDate sg_readStandardStrToDateDic:dateString];

    if (date) {
        return date;
    }
    
    date = [self sg_dateWithString:dateString format:@"yyyy-MM-dd"];
    [NSDate sg_cacheStandardStrToDateDic:dateString withDate:date];
    
    return date;
}

+ (NSDate *)sg_dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate sg_gregorianCalendar]];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)sg_dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate sg_gregorianCalendar]];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)sg_dateWithISOFormatString:(NSString *)dateString {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    });
    return [formatter dateFromString:dateString];
}

//stony
//+ (NSDate*)minDate
//{
//    return [self dateWithStandardString:kMinDate];
//}
//
//+ (NSDate*)maxDate
//{
//    return [self dateWithStandardString:kMaxDate];
//}
//
//+ (NSDate*)endlessDate
//{
//    return [[self dateWithStandardString:kMaxDate] dateByAddingDays:1];
//}
//- (BOOL)sg_isEndlessDate
//{
//    if([self sg_isSameDay:[NSDate sg_endlessDate]])
//        return YES;
//    else
//        return NO;
//}

+ (NSString*)sg_displayXValue:(NSString*)periodStart repeatMode:(NSInteger)mode
{
    NSDate *tmpStartDate = [[NSDate alloc] initWithTimeIntervalSince1970:[periodStart integerValue]];
    NSDate *now          = [NSDate sg_now];

    NSString *xValue = [tmpStartDate sg_stringMslashD];

    switch (mode) {
        case 0:
            if ([now sg_isSameDay:tmpStartDate]) {
                xValue = NSLocalizedString(@"Today",@"date");
            }
            break;
            
        case 1:
            if ([now sg_sameWeek:tmpStartDate]) {
                xValue = NSLocalizedString(@"This week",@"date");
            }
            break;

        case 2:
            if ([now sg_sameMonth:tmpStartDate]) {
                xValue = NSLocalizedString(@"This month",@"date");
            }
            break;
            
        default:
            break;
    }
    
    return xValue;
}

+ (NSString*)sg_displayXFullValue:(NSString*)periodStart repeatMode:(NSInteger)mode
{
    NSDate *tmpStartDate = [[NSDate alloc] initWithTimeIntervalSince1970:[periodStart integerValue]];
    NSDate *now          = [NSDate sg_now];
    
    NSString *xValue = [tmpStartDate sg_stringYYYYminusMminusD];
    
    switch (mode) {
        case 0:
            if ([now sg_isSameDay:tmpStartDate]) {
                xValue = NSLocalizedString(@"Today",@"date");
            }
            break;
            
        case 1:
            if ([now sg_sameWeek:tmpStartDate]) {
                xValue = NSLocalizedString(@"This week",@"date");
            }
            break;
            
        case 2:
            if ([now sg_sameMonth:tmpStartDate]) {
                xValue = NSLocalizedString(@"This month",@"date");
            } else {
                xValue = [tmpStartDate sg_stringYYYYminusM];
            }
            break;
            
        default:
            break;
    }
    
    return xValue;
}

+ (void)sg_cacheStandardStrToDateDic:(NSString*)standardStr withDate:(NSDate*)date
{
    if(standardStrToDateDic==nil)
    {
        standardStrToDateDic = [[NSMutableDictionary alloc] init];
    }
    
    [standardStrToDateDic setValue:date forKey:standardStr];
    
}

+ (NSDate*)sg_readStandardStrToDateDic:(NSString*)standardStr
{
    if(standardStrToDateDic==nil)
        return nil;
    
    return [standardStrToDateDic objectForKey:standardStr];
}

@end
