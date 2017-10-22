//
//  UIColor+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SGAddition)

+ (instancetype)sg_colorWithHexString:(NSString *)hexStr;

- (UIColor*)sg_adjustBright:(CGFloat)adjustPercent;

@end
