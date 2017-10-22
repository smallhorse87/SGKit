//
//  UITableView+YYBasedAdd.m
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import "UITableView+SGAddition.h"

#import "SGKitMarco.h"

@implementation UITableView (SGAddition)

- (void)sg_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)sg_reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    [self sg_reloadRowAtIndexPath:toReload withRowAnimation:animation];
}

- (void)sg_noSeparator
{
    [self sg_separatorInset:kSGScreenWidth];
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

- (void)sg_disableFollowReadableWidth
{
    if ([self respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        [self setCellLayoutMarginsFollowReadableWidth:NO];
    }
}

@end
