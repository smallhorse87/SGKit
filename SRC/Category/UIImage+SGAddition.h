//
//  UIImage+CXSAdded.h
//  TomatoTimer
//
//  Created by chen xiaosong on 16/5/27.
//  Copyright © 2016年 微加科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGAddition)


+ (UIImage *)sg_roundImageWithRadius:(CGFloat)radius
                        fillColor:(UIColor *)color
                      borderColor:(UIColor *)bdcolor;

/**
 Rounds a new image with a given corner size.
 
 @param radius  The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to half
 the width or height.
 */
- (nullable UIImage *)sg_imageByRoundCornerRadius:(CGFloat)radius;

/**
 Rounds a new image with a given corner size.
 
 @param radius       The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to
 half the width or height.
 
 @param borderWidth  The inset border line width. Values larger than half the rectangle's
 width or height are clamped appropriately to half the width
 or height.
 
 @param borderColor  The border stroke color. nil means clear color.
 */
- (nullable UIImage *)sg_imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

- (UIImage *)sg_imageByScale;

- (UIImage *)sg_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

- (NSData *)sg_imageByScalingToWithSize:(CGFloat)len;
@end
