//
//  UIFont+CXSAdd.m
//  youngcity
//
//  Created by chenxiaosong on 2017/2/21.
//  Copyright © 2017年 Zhitian Network Tech. All rights reserved.
//

#import "UIFont+SGAddition.h"

@implementation UIFont (SGAddition)

//PingFangSC-Light 细体
//PingFangSC-Medium 中黑体
//PingFangSC-Semibold 中粗体
//PingFangSC-Thin 纤细
//PingFangSC-Ultralight 及细体

- (CGFontRef)yc_FontRef
{
    CFStringRef fontName = (__bridge CFStringRef)self.fontName;

    return CGFontCreateWithFontName(fontName);
}

+ (UIFont*)yc_Pingfang:(CGFloat)size
{
    return [UIFont yc_Pingfang:size weight:UIFontWeightRegular];
}

+ (UIFont*)yc_Pingfang:(CGFloat)size weight:(CGFloat)weigth
{
    NSString *fontName = nil;
    
    if(weigth == UIFontWeightUltraLight) {
        fontName = @"PingFangSC-Ultralight";
    } else if (weigth == UIFontWeightThin) {
        fontName = @"PingFangSC-Thin";
    } else if (weigth == UIFontWeightLight) {
        fontName = @"PingFangSC-Light";
    } else if (weigth == UIFontWeightRegular) {
        fontName = @"PingFangSC-Regular";
    } else if (weigth == UIFontWeightMedium) {
        fontName = @"PingFangSC-Medium";
    } else if (weigth == UIFontWeightSemibold) {
        fontName = @"PingFangSC-Semibold";
    }

    NSAssert(fontName!=nil, @"non-supported font");
    
    return [UIFont fontWithName:fontName size:size];
}

@end
