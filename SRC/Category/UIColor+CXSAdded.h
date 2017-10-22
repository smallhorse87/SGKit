//
//  UIColor+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CXSAdded)

+ (instancetype)colorWithHexString:(NSString *)hexStr;

- (UIColor*)adjustBright:(CGFloat)adjustPercent;

@end
