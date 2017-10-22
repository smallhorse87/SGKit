//
//  UIButton+CXSAdd.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/2/11.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SGAddition)

- (void)sg_setLocalizedTitle:(NSString*)title;

- (void)sg_bgImageForAllState:(UIImage*)img;
- (void)sg_imageForAllState:(UIImage*)img;
- (void)sg_titleColorForAllState:(UIColor *)color;
- (void)sg_titleForAllState:(NSString *)title;

-(void)sg_addClickAction:(SEL)action target:(id)owner;

- (void)sg_setStyleRound:(CGFloat)radius
             normalColor:(UIColor *)nColor
          highlightColor:(UIColor *)hColor
            disableColor:(UIColor *)dColor
             borderColor:(UIColor *)bColor;

@end
