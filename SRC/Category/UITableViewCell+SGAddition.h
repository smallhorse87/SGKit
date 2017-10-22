//
//  UITableViewCell+CXSAdded.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/3/28.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SGAddition)

- (void)sg_noSeparator;
- (void)sg_separatorZeroInset;
- (void)sg_separatorInset08;
- (void)sg_separatorInset10;
- (void)sg_separatorInset12;
- (void)sg_separatorInset15;
- (void)sg_separatorInsetBothSide;

+ (UITableViewCell*)buildSeparatorCell;

@end
