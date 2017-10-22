//
//  UIFont+CXSAdd.h
//  youngcity
//
//  Created by chenxiaosong on 2017/2/21.
//  Copyright © 2017年 Zhitian Network Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (SGAddition)

+ (UIFont*)yc_Pingfang:(CGFloat)size;
+ (UIFont*)yc_Pingfang:(CGFloat)size weight:(CGFloat)weigth;

- (CGFontRef)yc_FontRef;

@end
