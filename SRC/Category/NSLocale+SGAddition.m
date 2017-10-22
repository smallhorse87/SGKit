//
//  NSLocale+CXSAdded.m
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/1/16.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import "NSLocale+SGAddition.h"

NSString *const notiStrictWarning = @"strict mode warning";
NSString *const notiStrictFailed  = @"strict mode failed";
NSString *const notiTaskReminder  = @"task reminder";
NSString *const notiFocusEnd      = @"focus end";
NSString *const notiBreakEnd      = @"break end";

@implementation NSLocale (SGAddition)

+ (BOOL)isChinese
{
    if ([NSLocalizedString(@"language",@"lang") isEqualToString:@"Chinese"]) {
        return YES;
    }
    
    return NO;
}

+ (NSString*)notificatitionMsg:(NSString*)key
{
    static NSDictionary *zhDic;
    static NSDictionary *enDic;
    
    if (zhDic==nil) {
        zhDic = @{
                  @"strict mode warning":@"快回到番茄自习室，专注要失败了。",
                  @"strict mode failed" :@"你又玩手机，专注失败了。",
                  @"task reminder"      :@"🏫今日活动\"%@\",加油!",
                  @"focus end"          :@"完成一次专注，休息一下！☕",
                  @"break end"          :@"休息结束，继续专注吧！🍅"
                  };
        
        enDic = @{
                  @"strict mode warning":@"Back to Steps or Focus will fail.",
                  @"strict mode failed" :@"Oops! Focus failed.",
                  @"task reminder"      :@"🏫Today's task \"%@\", go for it.",
                  @"focus end"          :@"Focus finished, take a break.☕",
                  @"break end"          :@"The break ended, keep focusing.🍅"
                  };
    }
    
    if ([self isChinese]) {
        return [zhDic objectForKey:key];
    } else {
        return [enDic objectForKey:key];
    }

}

@end
