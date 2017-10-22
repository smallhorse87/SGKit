//
//  NSURL+CXSAdd.m
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/5/27.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import "NSURL+CXSAdd.h"

#import "UIDevice+CXSAdded.h"

@implementation NSURL (CXSAdd)

+ (NSURL*) imgUrl:(NSString*)str
{
    return [self URLWithString:str];
}

@end
