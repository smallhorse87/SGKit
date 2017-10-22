//
//  UIApplication+YYBasedAdd.m
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import "UIApplication+SGAddition.h"

@implementation UIApplication (SGAddition)


- (NSString *)sg_appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)sg_appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)sg_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)sg_appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end
