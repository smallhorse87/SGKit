//
//  UITableViewCell+CXSAdded.m
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/3/28.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import "UITableViewCell+SGAddition.h"

@implementation UITableViewCell (SGAddition)

+ (UITableViewCell*)sg_buildSeparatorCell
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    //cell.backgroundColor = kColorBgPage;//stony debug

    [cell sg_noSeparator];
    
    return cell;
}

//stony debug
//- (void)cxs_noSeparator
//{
//    [self cxs_separatorInset:kScreenWidth];
//}

- (void)sg_separatorInsetBothSide
{
    [self sg_separatorInset:15 andRight:15];
}

- (void)sg_separatorInset:(CGFloat)left andRight:(CGFloat)right
{
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }

    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0,left,0,right)];
    }
}

- (void)sg_separatorZeroInset
{
    [self sg_separatorInset:0.0];
}

- (void)sg_separatorInset08
{
    [self sg_separatorInset:8.0];
}

- (void)sg_separatorInset10
{
    [self sg_separatorInset:10.0];
}

- (void)sg_separatorInset12
{
    [self sg_separatorInset:12.0];
}

- (void)sg_separatorInset15
{
    [self sg_separatorInset:15.0];
}

#pragma mark - utility

- (void)sg_separatorInset:(CGFloat)inset
{
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0,inset,0,0)];
    }
}

@end
