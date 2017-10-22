//
//  UIButton+CXSAdd.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/2/11.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CXSAdded)

- (void)setLocalizedTitle:(NSString*)title;

- (void)cxs_bgImageForAllState:(UIImage*)img;
- (void)cxs_imageForAllState:(UIImage*)img;
- (void)cxs_titleColorForAllState:(UIColor *)color;
- (void)cxs_titleForAllState:(NSString *)title;

-(void)addClickAction:(SEL)action target:(id)owner;

- (void)setStyleRound:(CGFloat)radius
          normalColor:(UIColor *)nColor
       highlightColor:(UIColor *)hColor
         disableColor:(UIColor *)dColor
          borderColor:(UIColor *)bColor;

@end
