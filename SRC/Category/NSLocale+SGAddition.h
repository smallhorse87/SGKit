//
//  NSLocale+SGAddition.h
//  SGKit
//
//  Created by chenxiaosong on 2017/10/22.
//  Copyright © 2017年 chenxiaosong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (SGAddition)

+ (BOOL)sg_isChinese;
+ (NSString*)sg_notificatitionMsg:(NSString*)key;

@end
