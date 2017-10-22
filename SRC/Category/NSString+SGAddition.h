//
//  NSString+CXSAdded.h
//  TomatoTimer
//
//  Created by chen xiaosong on 16/5/24.
//  Copyright © 2016年 微加科技. All rights reserved.
//

#import <UIKit/UIKit.h>

//stony debug
//#import "NSString+WPAttributedMarkup.h"

#define isEmptyString(string) (string == nil || string.length == 0)

@interface NSString (SGAddition)

- (NSString *)extensionOfFile;
- (NSString *)nameOfFile;

+ (BOOL)isEmpty:(NSString*)str;

+ (NSString *)DurationInStr:(NSInteger)timeInterval;

- (NSString*)limitWithLength:(NSInteger)len;

+ (NSMutableAttributedString*)buildDialogPomoCntAttributeString:(NSInteger)pomoCnt;

+ (NSMutableAttributedString*)buildActiveDaysAttributeString:(NSInteger)days fontWeight:(CGFloat)weight;
+ (NSMutableAttributedString*)buildConsumedTimeAttributeString:(NSInteger)timeInterval fontWeight:(CGFloat)weight;
+ (NSMutableAttributedString*)buildCompletedAssignmentAttributeString:(NSInteger)completedCnt fontWeight:(CGFloat)weight;

- (NSString *)stringByTrim;
- (NSString*) trimWhitespace;

+ (NSString*)displayInHour:(CGFloat)seconds;
+ (NSString*)displayShortFloat:(CGFloat)floatNum;

+ (NSString*)inspiration:(CGFloat)focusTime;

@end
