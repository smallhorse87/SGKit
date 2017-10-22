//
//  UITableViewCell+CXSAdded.h
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/3/28.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SGAddition)

- (void)cxs_noSeparator;
- (void)cxs_separatorZeroInset;
- (void)cxs_separatorInset08;
- (void)cxs_separatorInset10;
- (void)cxs_separatorInset12;
- (void)cxs_separatorInset15;
- (void)cxs_separatorInsetBothSide;

+ (UITableViewCell*)buildSeparatorCell;

@end
