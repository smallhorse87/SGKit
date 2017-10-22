//
//  NSString+CXSAdded.h
//  TomatoTimer
//
//  Created by chen xiaosong on 16/5/24.
//  Copyright © 2016年 微加科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#define isEmptyString(string) (string == nil || string.length == 0)

@interface NSString (SGAddition)

- (NSString *)sg_extensionOfFile;
- (NSString *)sg_nameOfFile;

+ (BOOL)sg_isEmpty:(NSString*)str;

+ (NSString *)sg_durationInStr:(NSInteger)timeInterval;

- (NSString*)sg_limitWithLength:(NSInteger)len;

+ (NSMutableAttributedString*)sg_buildDialogPomoCntAttributeString:(NSInteger)pomoCnt;

+ (NSMutableAttributedString*)sg_buildActiveDaysAttributeString:(NSInteger)days fontWeight:(CGFloat)weight;
+ (NSMutableAttributedString*)sg_buildConsumedTimeAttributeString:(NSInteger)timeInterval fontWeight:(CGFloat)weight;
+ (NSMutableAttributedString*)sg_buildCompletedAssignmentAttributeString:(NSInteger)completedCnt fontWeight:(CGFloat)weight;
+ (NSString*)sg_displayInHour:(CGFloat)seconds;
+ (NSString*)sg_inspiration:(CGFloat)focusTime;

- (NSString *)sg_stringByTrim;
- (NSString*) sg_trimWhitespace;

+ (NSString*)sg_displayShortFloat:(CGFloat)floatNum;



@end
