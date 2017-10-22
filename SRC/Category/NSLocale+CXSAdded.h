//
//  NSLocale+CXSAdded.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/1/16.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const notiStrictWarning;
extern NSString *const notiStrictFailed;
extern NSString *const notiTaskReminder;
extern NSString *const notiFocusEnd;
extern NSString *const notiBreakEnd;

@interface NSLocale (CXSAdded)

+ (BOOL)isChinese;

+ (NSString*)notificatitionMsg:(NSString*)key;

@end
