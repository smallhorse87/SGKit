//
//  UIButton+CXSAdd.m
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/2/11.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import "UIButton+SGAddition.h"

#import "UIImage+SGAddition.h"
#import "UIColor+SGAddition.h"

@implementation UIButton (SGAddition)

- (void)sg_setLocalizedTitle:(NSString*)title
{
    [self setTitle:NSLocalizedString(title, @"button title") forState:UIControlStateNormal];
    [self setTitle:NSLocalizedString(title, @"button title") forState:UIControlStateHighlighted];
    [self setTitle:NSLocalizedString(title, @"button title") forState:UIControlStateDisabled];
}

- (void)sg_setStyleRound:(CGFloat)radius
          normalColor:(UIColor *)nColor
       highlightColor:(UIColor *)hColor
         disableColor:(UIColor *)dColor
          borderColor:(UIColor *)bColor
{
    [self setBackgroundImage:[UIImage sg_roundImageWithRadius:radius fillColor:nColor borderColor:bColor]
                    forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage sg_roundImageWithRadius:radius fillColor:hColor borderColor:bColor]
                    forState:UIControlStateHighlighted];
    
    [self setBackgroundImage:[UIImage sg_roundImageWithRadius:radius fillColor:dColor borderColor:bColor]
                    forState:UIControlStateDisabled];
}

- (void)sg_bgImageForAllState:(UIImage*)img
{
    [self setBackgroundImage:img forState:UIControlStateNormal];
    [self setBackgroundImage:img forState:UIControlStateHighlighted];
    [self setBackgroundImage:img forState:UIControlStateDisabled];
    [self setBackgroundImage:img forState:UIControlStateSelected];
}

- (void)sg_imageForAllState:(UIImage*)img
{
    [self setImage:img forState:UIControlStateNormal];
    [self setImage:img forState:UIControlStateHighlighted];
    [self setImage:img forState:UIControlStateDisabled];
    [self setImage:img forState:UIControlStateSelected];
}

- (void) sg_titleColorForAllState:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateDisabled];
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (void) sg_titleForAllState:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateDisabled];
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)sg_addClickAction:(SEL)action target:(id)owner
{
    [self sg_removeClickAction];
    
    [self addTarget:owner action:action forControlEvents:UIControlEventTouchUpInside];
}

-(void)sg_removeClickAction
{
    [self removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
}

@end
