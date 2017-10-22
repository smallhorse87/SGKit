//
//  UITableView+YYBasedAdd.m
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import "UITableView+CXSAdded.h"

@implementation UITableView (CXSAdded)

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    [self reloadRowAtIndexPath:toReload withRowAnimation:animation];
}

//stony debug
//- (void)cxs_noSeparator
//{
//    [self cxs_separatorInset:kScreenWidth];
//}

#pragma mark - utility

- (void)cxs_separatorInset:(CGFloat)inset
{
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0,inset,0,0)];
    }
}

- (void)cxs_disableFollowReadableWidth
{
    if ([self respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        [self setCellLayoutMarginsFollowReadableWidth:NO];
    }
}

@end
