//
//  NSDate+CXSAdded.m
//  Pomodoroom
//
//  Created by chen xiaosong on 16/8/5.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import "NSDate+SGAddition.h"

#import "NSLocale+SGAddition.h"

#import <time.h>

static NSDictionary *standardStrToDateDic = nil;

@implementation NSDate (SGAddition)

// default Sunday->1
- (NSString *)dayRangeStart
{
    NSDate *firstMoment = self.firstMomentOfThisDay;
    
    NSString *dayRange = [NSString stringWithFormat:@"%ld",(NSInteger)firstMoment.timeIntervalSince1970];

    return dayRange;
}

- (NSString *)weekRangeStart
{
    NSDate *beginingOfWeek = self.firstMomentOfThisWeek;

    NSString *weekRange = [NSString stringWithFormat:@"%ld",(NSInteger)beginingOfWeek.timeIntervalSince1970];

    return weekRange;
}

-(NSString *)monthRangeStart
{
    NSDate *beginingOfMonth = self.firstMomentOfThisMonth;

    NSString *monthRange = [NSString stringWithFormat:@"%ld",(NSInteger)beginingOfMonth.timeIntervalSince1970];;
    
    return monthRange;
}

+ (NSString*)stringForPeriodKey:(NSString*)periodKey
{
    NSArray *dateArr = [periodKey componentsSeparatedByString:@" "];

    NSDate *startDate = [NSDate dateWithStandardString:dateArr[0]];
    NSDate *endDate   = [NSDate dateWithStandardString:dateArr[1]];
    NSDate *now       = [NSDate now];

    BOOL todayWithinPeriod = [now isWithinPeriod:startDate toDate:endDate];

    NSString *periodStr;
    NSString *extraStr = @"";

    NSInteger diffDays = [startDate diffDayToDate:endDate];

    if (diffDays == 0) {
        //按天
        periodStr = [startDate stringMMslashDD];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(Today)",@"date");
        }
        
    } else if(diffDays == 7 - 1) {
        //按周
        periodStr = [NSString stringWithFormat:@"%@ - %@", [startDate stringMMslashDD], [endDate stringMMslashDD]];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(This week)",@"date");
        }
        
    } else {
        //按月
        periodStr = [NSString stringWithFormat:@"%@ - %@", [startDate stringMMslashDD], [endDate stringMMslashDD]];
        
        if (todayWithinPeriod) {
            extraStr = NSLocalizedString(@"(This month)",@"date");
        }
    }

    return [periodStr stringByAppendingString:extraStr];
}

+ (NSCalendar *)gregorianCalendar
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    calendar.firstWeekday = 2;
    
    return calendar;
}

+ (NSDateComponents *)currentDateComponents
{
    NSCalendar *calendar = [NSDate gregorianCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    return [calendar components:unitFlags fromDate:[NSDate date]];
}

+ (NSInteger)elapsedDaysOfThisMonth:(NSDate*)toDate from:(NSDate*)fromDate
{
    NSDate *firstMonthDateOfToDate = [toDate firstMomentOfThisMonth];
    
    NSDate *firstMonthDateOfFromDate = [fromDate firstMomentOfThisMonth];

    //起始和结束在同一月
    if ([firstMonthDateOfToDate diffMonthToDate:firstMonthDateOfFromDate]==0) {
        return [fromDate diffDayToDate:toDate]+1;
    } else {
        return toDate.day;
    }
}

//计算当前前周的有效天数
+ (NSInteger)elapsedDaysOfThisWeek:(NSDate*)toDate from:(NSDate*)fromDate
{
    NSDate *firstWeekDateOfToDate = [toDate firstMomentOfThisWeek];

    NSDate *firstWeekDateOfFromDate = [fromDate firstMomentOfThisWeek];
    
    //起始和结束在同一周
    if ([firstWeekDateOfToDate diffWeekToDate:firstWeekDateOfFromDate]==0) {
        return [fromDate diffDayToDate:toDate]+1;
    } else {
        return toDate.weekday;
    }
}

+ (NSDate*)now
{
    return [[NSDate alloc] init];
}

+ (NSInteger)currentMonth
{
    return [self currentDateComponents].month;
}

+ (NSInteger)currentYear
{
    return [self currentDateComponents].year;
}

+ (NSInteger)currentDay
{
    return [self currentDateComponents].day;
}

+ (NSInteger)currentWeekday
{
    return [self now].weekday;
}

+ (NSString*)currentWeekdaySymbol
{
    NSInteger weekday  = [self now].weekday;
    NSArray   *symbols = [self weekDayFullEnglishSymbols];

    return symbols[weekday-1];
}

+ (NSInteger)getDaysWithYear:(NSInteger)year
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

- (NSInteger)year {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)weekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    if (components.weekday == 1) {
        return 7;
    } else {
        return components.weekday - 1;
    }
}

+(NSArray*)weekDayFullEnglishSymbols
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

+(NSArray*)weekDaySymbols
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

+(NSArray*)shortWeekDaySymbols
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


- (NSString *)weekdaySymbol {
    NSInteger w = self.weekday;
    
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

- (NSInteger)weekdayOrdinal {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (NSDate *)nextDay {
    NSCalendar *calendar = [NSDate gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    components.day++;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)lastDay {
    NSCalendar *calendar = [NSDate gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    components.day--;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)beginDateToUnitGranularity:(NSCalendarUnit)unit
{
    NSDate *beginDate;
    NSTimeInterval interval;
    
    NSCalendar *calendar = [NSDate gregorianCalendar];
    calendar.firstWeekday = 2;
    
    BOOL ok = [calendar rangeOfUnit:unit startDate:&beginDate interval:&interval forDate:self];
    
    NSAssert(ok, @"MUST be TRUE");
    
    return beginDate;
    
}

- (NSDate *)endDateToUnitGranularity:(NSCalendarUnit)unit
{
    NSDate *beginDate;
    NSTimeInterval interval;
    
    NSCalendar *calendar = [NSDate gregorianCalendar];
    calendar.firstWeekday = 2;
    
    BOOL ok = [calendar rangeOfUnit:unit startDate:&beginDate interval:&interval forDate:self];
    
    NSAssert(ok, @"MUST be TRUE");
    
    return [beginDate dateByAddingTimeInterval:interval-1];
}

- (NSDate *)firstMomentOfThisDay {
    return [self beginDateToUnitGranularity:NSCalendarUnitDay];
}

- (NSDate *)firstMomentOfThisMonth {
    return [self beginDateToUnitGranularity:NSCalendarUnitMonth];
}

- (NSDate *)lastMomentOfThisMonth {
    return [self endDateToUnitGranularity:NSCalendarUnitMonth];
}

- (NSDate *)firstMomentOfThisWeek {
    return [self beginDateToUnitGranularity:NSCalendarUnitWeekOfMonth];
}

- (NSDate *)lastMomentOfThisWeek {
    return [self endDateToUnitGranularity:NSCalendarUnitWeekOfMonth];
}


- (BOOL)isLeapMonth {
    return [[[NSDate gregorianCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}

- (BOOL)isWithinPeriod:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSInteger offsetBetweenFromDateAndToday = [fromDate diffDayToDate:self];
    NSInteger offsetBetweenTodayAndEndDate  = [self     diffDayToDate:toDate];
    
    if (offsetBetweenFromDateAndToday>=0 && offsetBetweenTodayAndEndDate>=0) {
        return YES;
    }
    
    return NO;
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSDate gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSDate gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}


- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSDate gregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

//get another date
- (NSInteger)diffDayToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSDate gregorianCalendar];
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitDay fromDate:self.firstMomentOfThisDay  toDate:toDate.firstMomentOfThisDay  options:0];
    
    return [comps day];
    
}

- (NSInteger)diffWeekToDate:(NSDate *)toDate
{
    NSDate *beginingWeekOfFromDate = self.firstMomentOfThisWeek;
    NSDate *beginingWeekOfToDate   = toDate.firstMomentOfThisWeek;
    
    NSInteger diffDay = [beginingWeekOfFromDate diffDayToDate:beginingWeekOfToDate];
    
    return diffDay/7;
    
}

- (NSInteger)diffMonthToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSDate gregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:self.firstMomentOfThisMonth
                                                 toDate:toDate.firstMomentOfThisMonth
                                                options:0];
    return components.month;
}

+ (NSComparisonResult)compareDay:(NSDate *)first with:(NSDate *)second
{
    return [[NSDate gregorianCalendar] compareDate:first toDate:second toUnitGranularity:NSCalendarUnitDay];
}

+ (NSComparisonResult)compareTime:(NSDate *)first with:(NSDate *)second
{
    return [[NSDate gregorianCalendar] compareDate:first toDate:second toUnitGranularity:NSCalendarUnitSecond];
}

+ (NSDate*)compareMaxDay:(NSDate*)first with:(NSDate*)second
{
    NSAssert((first!=nil) && (second!=nil), @"input Can not be nil");
    
    NSAssert([first  isKindOfClass:[NSDate class]], @"input must be NSDate");
    NSAssert([second isKindOfClass:[NSDate class]], @"input must be NSDate");
    
    //大小比较 大于
    if([self compareDay:first with:second] == NSOrderedAscending)
    {
        return second;
    } else {
        return first;
    }
}

+ (NSDate*)compareMinDay:(NSDate *)first with:(NSDate *)second
{
    NSAssert((first!=nil) && (second!=nil), @"input Can not be nil");
    
    NSAssert([first  isKindOfClass:[NSDate class]], @"input must be NSDate");
    NSAssert([second isKindOfClass:[NSDate class]], @"input must be NSDate");
    
    //大小比较 大于
    if([self compareDay:first with:second] == NSOrderedAscending)
    {
        return first;
    } else {
        return second;
    }
}

- (BOOL)isLaterOrSameDay:(NSDate*)date
{
    NSComparisonResult result = [NSDate compareDay:self with:date];
    
    if((result==NSOrderedDescending) || (result==NSOrderedSame))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isLaterThanTime:(NSDate*)date
{
    NSComparisonResult result = [NSDate compareTime:self with:date];
    
    if((result==NSOrderedDescending) || (result==NSOrderedSame))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isSameDay:(NSDate *)date
{
    return [[NSDate gregorianCalendar] isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitDay];
}

- (BOOL)sameMonth:(NSDate *)date
{
    NSDate *firstMomentOfThisMonth = [self firstMomentOfThisMonth];
    
    return [date isSameDay:firstMomentOfThisMonth];
}

- (BOOL)sameWeek:(NSDate *)date
{
    NSDate *firstMomentOfThisWeek = [self firstMomentOfThisWeek];
    
    return [date isSameDay:firstMomentOfThisWeek];
}

-(NSString *)standardShortString
{
    return [self cxs_stringWithFormat:@"yyyy-M-d"];
}

-(NSString *)standardString
{
    return [self cxs_stringWithFormat:@"yyyy-MM-dd"];
}

-(NSString *)stringYYYYminusMminusD
{
    return [self cxs_stringWithFormat:@"yyyy-M-d"];
}

-(NSString *)stringYYYYminusMM
{
    return [self cxs_stringWithFormat:@"yyyy-MM"];
}

-(NSString *)stringYYYYminusM
{
    return [self cxs_stringWithFormat:@"yyyy-M"];
}

-(NSString *)stringMMslashDD
{
    return [self cxs_stringWithFormat:@"MM/dd"];
}

-(NSString *)stringMMminusDD
{
    return [self cxs_stringWithFormat:@"MM-dd"];
}

-(NSString *)stringMslashD
{
    return [self cxs_stringWithFormat:@"M/d"];
}


-(NSString *)stringMMDDWord
{
    if ([NSLocale isChinese]) {
        return [self cxs_stringWithFormat:@"MM月dd日"];
    } else {
        return [self cxs_stringWithFormat:@"MMM d"];
    }
    
}

-(NSString *)stringMDWord
{
    if ([NSLocale isChinese]) {
        return [self cxs_stringWithFormat:@"M月d日"];
    } else {
        return [self cxs_stringWithFormat:@"MMM d"];
    }
    
}

-(NSString *)stringYYYYMMDDWord
{
    if ([NSLocale isChinese]) {
        return [self cxs_stringWithFormat:@"yyyy年MM月dd日"];
    } else {
        return [self cxs_stringWithFormat:@"MMM d, yyyy"];
    }
    
    
}

-(NSString *)stringHHcolonMM
{
    return [self cxs_stringWithFormat:@"HH:mm:ss"];
}

-(NSString *)stringFullTime
{
    return [self cxs_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)cxs_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate gregorianCalendar]];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

+ (NSDate *)dateWithStandardString:(NSString *)dateString{
    
    NSAssert([dateString isKindOfClass:[NSString class]], @"Must be NSString");

    if (dateString == nil || dateString.length == 0) {
        return nil;
    }
    
    NSDate *date = [NSDate readStandardStrToDateDic:dateString];

    if (date) {
        return date;
    }
    
    date = [self dateWithString:dateString format:@"yyyy-MM-dd"];
    [NSDate cacheStandardStrToDateDic:dateString withDate:date];
    
    return date;
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate gregorianCalendar]];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSDate gregorianCalendar]];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)dateWithISOFormatString:(NSString *)dateString {
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

- (BOOL)isEndlessDate
{
    if([self isSameDay:[NSDate endlessDate]])
        return YES;
    else
        return NO;
}

+ (NSString*)displayXValue:(NSString*)periodStart repeatMode:(NSInteger)mode
{
    NSDate *tmpStartDate = [[NSDate alloc] initWithTimeIntervalSince1970:[periodStart integerValue]];
    NSDate *now          = [NSDate now];

    NSString *xValue = [tmpStartDate stringMslashD];

    switch (mode) {
        case 0:
            if ([now isSameDay:tmpStartDate]) {
                xValue = NSLocalizedString(@"Today",@"date");
            }
            break;
            
        case 1:
            if ([now sameWeek:tmpStartDate]) {
                xValue = NSLocalizedString(@"This week",@"date");
            }
            break;

        case 2:
            if ([now sameMonth:tmpStartDate]) {
                xValue = NSLocalizedString(@"This month",@"date");
            }
            break;
            
        default:
            break;
    }
    
    return xValue;
}

+ (NSString*)displayXFullValue:(NSString*)periodStart repeatMode:(NSInteger)mode
{
    NSDate *tmpStartDate = [[NSDate alloc] initWithTimeIntervalSince1970:[periodStart integerValue]];
    NSDate *now          = [NSDate now];
    
    NSString *xValue = [tmpStartDate stringYYYYminusMminusD];
    
    switch (mode) {
        case 0:
            if ([now isSameDay:tmpStartDate]) {
                xValue = NSLocalizedString(@"Today",@"date");
            }
            break;
            
        case 1:
            if ([now sameWeek:tmpStartDate]) {
                xValue = NSLocalizedString(@"This week",@"date");
            }
            break;
            
        case 2:
            if ([now sameMonth:tmpStartDate]) {
                xValue = NSLocalizedString(@"This month",@"date");
            } else {
                xValue = [tmpStartDate stringYYYYminusM];
            }
            break;
            
        default:
            break;
    }
    
    return xValue;
}

+ (void)cacheStandardStrToDateDic:(NSString*)standardStr withDate:(NSDate*)date
{
    if(standardStrToDateDic==nil)
    {
        standardStrToDateDic = [[NSMutableDictionary alloc] init];
    }
    
    [standardStrToDateDic setValue:date forKey:standardStr];
    
}

+ (NSDate*)readStandardStrToDateDic:(NSString*)standardStr
{
    if(standardStrToDateDic==nil)
        return nil;
    
    return [standardStrToDateDic objectForKey:standardStr];
}

@end
