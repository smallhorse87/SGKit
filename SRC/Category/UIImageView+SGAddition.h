//
//  UIImageView+CXSAdd.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/5/26.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SGAddition)

- (void)sg_withObject:(id)obj andDefaultImg:(NSString*)defaultImg sucBlock:(void (^)())sucBlock;

- (void)sg_withUrlObject:(id)obj sucBlock:(void (^)())sucBlock;

@end
