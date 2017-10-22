//
//  UITableView+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SGAddition)

- (void)sg_reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)sg_noSeparator;

- (void)sg_disableFollowReadableWidth;

@end
