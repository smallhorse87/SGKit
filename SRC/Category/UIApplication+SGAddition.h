//
//  UIApplication+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SGAddition)

- (NSString *)sg_appBundleName;
- (NSString *)sg_appBundleID;
- (NSString *)sg_appVersion;
- (NSString *)sg_appBuildVersion;

@end
