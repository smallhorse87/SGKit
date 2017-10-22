//
//  NSString+CXSAdded.m
//  TomatoTimer
//
//  Created by chen xiaosong on 16/5/24.
//  Copyright © 2016年 微加科技. All rights reserved.
//

#import "NSString+SGAddition.h"

#import "UIColor+SGAddition.h"

@implementation NSString (SGAddition)


- (NSString*) trimWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)extensionOfFile
{
    NSArray *splitStrArr = [self componentsSeparatedByString:@"."];
    
    if (splitStrArr != nil && splitStrArr.count == 2)
        return [splitStrArr lastObject];
    else
        return nil;
}

- (NSString *)nameOfFile
{
    NSArray *splitStrArr = [self componentsSeparatedByString:@"."];
    
    if (splitStrArr != nil && splitStrArr.count == 2)
        return [splitStrArr firstObject];
    else
        return nil;
}

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

+ (BOOL)isEmpty:(NSString*)str
{
    if(str == nil)
        return YES;
    
    NSString *trimStr = [str stringByTrim];
    
    if (trimStr.length == 0) {
        return YES;
    }

    return NO;
}

- (NSString*)limitWithLength:(NSInteger)len
{
    if (self.length <= len) {
        return self;
    }

    return [self substringWithRange:NSMakeRange(0, len)];
}

+ (NSString *)DurationInStr:(NSInteger)timeInterval
{
    NSInteger mintues = timeInterval / 60;
    
    NSInteger mintuePart = mintues % 60;
    
    NSInteger hourPart   = mintues / 60;

    return [NSString stringWithFormat:@"%02ld:%02ld",hourPart,mintuePart];
}

//stony debug
//+ (NSMutableAttributedString*)buildDialogPomoCntAttributeString:(NSInteger)pomoCnt
//{
//    NSDictionary    *style          = @{
//                                        @"sum": @[
//                                                [UIFont systemFontOfSize:48.0 weight:UIFontWeightMedium]
//                                                ],
//                                        @"txt": @[
//                                                [UIFont systemFontOfSize:12.0]
//                                                ],
//                                        };
//
//    NSString *sumStr = [NSString stringWithFormat:@"<sum>%ld</sum><txt>%@</txt>", pomoCnt, NSLocalizedString(@"pomos",@"quantity - pomo")];
//
//    return [[NSMutableAttributedString alloc] initWithAttributedString:[sumStr attributedStringWithStyleBook:style]];
//}
//
////UIFontWeightMedium UIFontWeightLight
//+ (NSMutableAttributedString*)buildActiveDaysAttributeString:(NSInteger)days fontWeight:(CGFloat)weight
//{
//    NSDictionary    *style          = @{
//                                        @"sum": @[
//                                                [UIFont systemFontOfSize:15.0 weight:weight]
//                                                ],
//                                        @"txt": @[
//                                                [UIFont systemFontOfSize:12.0 weight:weight]
//                                                ],
//                                        };
//
//    NSString *sumStr = [NSString stringWithFormat:@"<sum>%ld</sum><txt> %@</txt>", days, NSLocalizedString(@"days",@"time")];
//
//    return [[NSMutableAttributedString alloc] initWithAttributedString:[sumStr attributedStringWithStyleBook:style]];
//}
//
//+ (NSMutableAttributedString*)buildConsumedTimeAttributeString:(NSInteger)timeInterval fontWeight:(CGFloat)weight
//{
//    NSInteger mintues = timeInterval/60;
//
//    NSInteger mintuePart = mintues%60;
//
//    NSInteger hourPart   = mintues/60;
//
//    NSDictionary    *style          = @{
//                                        @"sum": @[
//                                                [UIFont systemFontOfSize:15.0 weight:weight]
//                                                ],
//                                        @"txt": @[
//                                                [UIFont systemFontOfSize:12.0 weight:weight]
//                                                ],
//                                        };
//
//    NSString *sumStr = [NSString stringWithFormat:@"<sum>%ld</sum><txt> %@</txt> <sum>%ld</sum><txt> %@</txt>", hourPart, NSLocalizedString(@"hrs",@"quantity - mintues"), mintuePart, NSLocalizedString(@"mins",@"quantity - mintues")];
//
//    return [[NSMutableAttributedString alloc] initWithAttributedString:[sumStr attributedStringWithStyleBook:style]];
//}
//
//+ (NSMutableAttributedString*)buildCompletedAssignmentAttributeString:(NSInteger)completedCnt fontWeight:(CGFloat)weight
//{
//    NSDictionary    *style          = @{
//                                        @"sum": @[
//                                                [UIFont systemFontOfSize:15.0 weight:weight]
//                                                ],
//                                        @"txt": @[
//                                                [UIFont systemFontOfSize:12.0 weight:weight]
//                                                ],
//                                        };
//
//    NSString *sumStr = [NSString stringWithFormat:@"<sum>%ld</sum><txt> %@</txt>", completedCnt, NSLocalizedString(@"tasks",@"quantity")];
//
//    return [[NSMutableAttributedString alloc] initWithAttributedString:[sumStr attributedStringWithStyleBook:style]];
//}

//保留1位小数，去掉无意义的0
//stony
//+ (NSString*)displayInHour:(CGFloat)seconds
//{
//    NSString *hourStr = [self displayShortFloat:seconds/kSecondsPerHour];
//
//    return [hourStr stringByAppendingString:@"h"];
//}

+ (NSString*)displayShortFloat:(CGFloat)floatNum
{
    NSString *floatStr = [NSString stringWithFormat:@"%.1lf",floatNum];
    
    if ([floatStr containsString:@".0"]) {
        floatStr = [NSString stringWithFormat:@"%.0lf",floatNum];
    }
    
    return floatStr;
}

//stony
//+ (NSString*)inspiration:(CGFloat)focusTime
//{
//    NSAssert(focusTime>=0, @"should greater than zero");
//
//    NSString *msg = nil;
//
//    CGFloat focusMintues = focusTime/kSecondPerMinute;
//
//    if (focusMintues>750) {
//        msg = @"宁静致远";
//    } else if (focusMintues>500) {
//        msg = @"遇见心流";
//    } else if (focusMintues>360) {
//        msg = @"发奋图强";
//    } else if (focusMintues>320) {
//        msg = @"高歌猛进";
//    } else if (focusMintues>280) {
//        msg = @"乘风破浪";
//    } else if (focusMintues>240) {
//        msg = @"废寝忘食";
//    }else if (focusMintues>200) {
//        msg = @"披荆斩棘";
//    } else if (focusMintues>160) {
//        msg = @"只争朝夕";
//    } else if (focusMintues>120) {
//        msg = @"全力以赴";
//    } else if (focusMintues>80) {
//        msg = @"心无旁骛";
//    } else if (focusMintues>40) {
//        msg = @"渐入佳境";
//    } else if (focusMintues>0) {
//        msg = @"完美开局";
//    }
//
//    return msg;
//}


@end
